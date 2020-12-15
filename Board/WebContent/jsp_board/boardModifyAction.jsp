<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>board modify Action</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) { //no 와 pw 값이 없을경우 리스트로 돌아간다.
		response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("boardModifyAction param boardNo :"+boardNo);
        String boardPw = request.getParameter("boardPw");
		System.out.println("boardModifyAction param boardPw :"+boardPw);
		String boardTitle = request.getParameter("boardTitle");
		System.out.println("boardModifyAction param boardTitle :"+boardTitle);
		String boardContent = request.getParameter("boardContent");
		System.out.println("boardModifyAction param boardContent :"+boardContent);
        
		String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
		String dbUser = "root";
		String dbPw = "java1004";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String selectSql = "update board set board_title=?, board_content=? where board_no=? and board_pw=?";
			statement = connection.prepareStatement(selectSql);
			statement.setString(1, boardTitle);
			statement.setString(2, boardContent);
			statement.setInt(3, boardNo);
			statement.setString(4, boardPw);
			statement.executeUpdate();
			response.sendRedirect(request.getContextPath()+"/jsp_board/boardView.jsp?boardNo="+boardNo);
		} catch(Exception e) {
			e.printStackTrace();
			out.print("게시글 수정 액션 에러!");
		} finally {
			try {statement.close();} catch(Exception e){}
			try {connection.close();} catch(Exception e){}
		}
	}
%>
</body>
</html>