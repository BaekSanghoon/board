<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model2.Board" %>
<%@ page import="model2.BoardDao" %>
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
<h1>게시글 자세히보기(모델2)</h1>
</div>
<%
    Board board = (Board)request.getAttribute("board");
%>
		  <table class="table table-dark table-striped">
				<tr><td>board_no : <%=board.getBoardNo()%></td></tr>
				<tr><td>board_title : <%=board.getBoardTitle()%></td></tr>
				<tr><td>board_content :<%=board.getBoardContent()%></td></tr>
				<tr><td>board_user : <%=board.getBoardUser()%></td></tr>
				<tr><td>board_date : <%=board.getBoardDate()%></td></tr>
		 </table>	
		 	<a type="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/model2_board/boardModifyFormServlet.do?boardNo=<%=board.getBoardNo()%>">수정</a>
		 	<a type="button" class="btn btn-outline-danger" href="<%=request.getContextPath()%>/model2_board/boardRemoveForm.jsp?boardNo=<%=board.getBoardNo()%>">삭제</a>
		 	<a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/model2_board/boardListServlet.do">글목록</a>
</body>
</html>