<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model2.Board" %>
<%@ page import="model2.BoardDao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<!-- 부트 스트랩 CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>
  <div class="alert alert-dark">
    <h1>게시글 목록(모델2)</h1>
  </div>

	<div>전체행의 수 : <%=request.getAttribute("totalRowCount")%></div>
	<table class="table table-dark table-hover">
		<thead>
			<tr>
				<th>boardTitle</th>
				<th>boardUser</th>
				<th>boardDate</th>
			</tr>
		</thead>
		<tbody>
<%
		ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
		for(Board b : list) {
%>
            <tr>
                <td><a href="<%=request.getContextPath()%>/model2_board/boardViewServlet.do?boardNo=<%=b.getBoardNo()%>"><%=b.getBoardTitle()%></a></td>
                <td><%=b.getBoardUser()%></td>
                <td><%=b.getBoardDate()%></td>
            </tr>
<%        
			}
%>
		</tbody>
	</table>
	<div>
		<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/model2_board/boardAddForm.jsp">게시글 입력</a>		
	</div>
<%
	int currentPage = (Integer)request.getAttribute("currentPage");
	int lastPage = (Integer)request.getAttribute("lastPage");

%>
	<div>
<%
		if(currentPage>1) { // 현재 페이지가 1페이지보다 크면 이전페이지 링크를 추가
%>
			<a type="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/model2_board/boardListServlet.do?currentPage=<%=currentPage-1%>">이전</a>
<%
		}
		if(currentPage < lastPage) { // 현재 페이지가 마지막 페이지보다 작으면 다음페이지 링크를 추가
%>
			<a type="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/model2_board/boardListServlet.do?currentPage=<%=currentPage+1%>">다음</a>
<%
		}
%>
	</div>

</body>
</html>
