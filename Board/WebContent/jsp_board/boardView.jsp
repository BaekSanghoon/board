<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>boardView</title>
<!-- 부트 스트랩 CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>
<div class="alert alert-dark">
<h1>게시글 자세히보기</h1>
</div>
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
		  <table class="table table-dark table-striped">
				<tr><td>board_no : <%=boardNo%></td></tr>
				<tr><td>board_title : <%=resultSet.getString("board_title")%></td></tr>
				<tr><td>board_content :<%=resultSet.getString("board_content")%></td></tr>
				<tr><td>board_user : <%=resultSet.getString("board_user")%></td></tr>
				<tr><td>board_date : <%=resultSet.getString("board_date")%></td></tr>
		 </table>	
		 	<a type="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/jsp_board/boardModifyForm.jsp?boardNo=<%=boardNo%>">수정</a>
		 	<a type="button" class="btn btn-outline-danger" href="<%=request.getContextPath()%>/jsp_board/boardRemoveForm.jsp?boardNo=<%=boardNo%>">삭제</a>
					
					
           		
         
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