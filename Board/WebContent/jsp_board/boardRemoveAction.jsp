<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>boardRemoveAction</title>
</head>
<body>
<%
	
	if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) { // no 나 pw값이 없으면 리스트로 이동
		response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		// System.out.println("boardNo :"+boardNo);
		String boardPw = request.getParameter("boardPw");
		// System.out.println("boardPw :"+boardPw);
		String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
		String dbUser = "root";
		String dbPw = "java1004";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String sql = "delete from board where board_no=? and board_pw=?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, boardNo);
			statement.setString(2, boardPw);
			if(statement.executeUpdate()==1){
				response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
			} else {
				response.sendRedirect(request.getContextPath()+"/jsp_board/boardRemoveForm.jsp?boardNo="+boardNo);
			}
		} catch(Exception e) {
			e.printStackTrace();
			out.print("오류 발생!");
		} finally {
			try {statement.close();} catch(Exception e){}
			try {connection.close();} catch(Exception e){}
		}
	}
%>
</body>
</html>