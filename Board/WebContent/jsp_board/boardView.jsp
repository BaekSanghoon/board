<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>boardView</title>
</head>
<body>
<h1>게시글 자세히보기</h1>
<%
	if(request.getParameter("boardNo") == null) {
		response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
		} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		//System.out.println("boardNo :"+boardNo);
		String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
		String dbUser = "root";
		String dbPw = "java1004";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String sql = "select board_title, board_content, board_user, board_date from board where board_no=?";
			statement = connection.prepareStatement(sql);
			statement.setInt(1, boardNo);
			resultSet = statement.executeQuery();
			if(resultSet.next()) {
%>
				<div>board_no : <%=boardNo%></div>
				<div>board_title : <%=resultSet.getString("board_title")%></div>
				<div>board_content :</div> <div><%=resultSet.getString("board_content")%></div>
				<div>board_user : <%=resultSet.getString("board_user")%></div>
				<div>board_date : <%=resultSet.getString("board_date")%></div>
				<div>
					<a href="<%=request.getContextPath()%>/jsp_board/boardModifyForm.jsp?boardNo=<%=boardNo%>">수정</a>
					<a href="<%=request.getContextPath()%>/jsp_board/boardRemoveForm.jsp?boardNo=<%=boardNo%>">삭제</a>
           
				</div>
<%			}
		} catch(Exception e) {
			e.printStackTrace();
			out.println("BOARD VIEW ERROR!");
		} finally {
			try {resultSet.close();} catch(Exception e){}
			try {statement.close();} catch(Exception e){}
			try {connection.close();} catch(Exception e){}
		}
	}
%>
</body>
</html>