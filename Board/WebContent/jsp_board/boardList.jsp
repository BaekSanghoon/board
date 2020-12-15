<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
    <h1>게시글 목록</h1>
  </div>
<%	
	//페이징 
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) { //넘어오는 값이 null이면 1를 대입한다.
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	System.out.println("currentPage"+currentPage);
	
	//전체 행의 수
	int totalRowCount = 0;
	//DB연동
	String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
	String dbUser = "root";
	String dbPw = "java1004";
	Connection connection = null;
	//총 목록 갯수
	PreparedStatement totalStatement = null;
	//리스트당 목록 갯수
	PreparedStatement listStatement = null;
	//명령에 대한 반환값
	ResultSet totalResultSet = null;
	ResultSet listResultSet = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		
		//board테이블의 전체행의 수를 세어서 반환
		String totalSql = "select count(*) from board";
		totalStatement = connection.prepareStatement(totalSql);
		totalResultSet = totalStatement.executeQuery();
		if(totalResultSet.next()) {
			totalRowCount = totalResultSet.getInt(1);
		}
%>
	<span class="badge badge-pill badge-success">전체 행의 수 :<%=totalRowCount %></span>
<% 
	//페이지당 보여줄 게시글 숫자 설정
	int pagePerRow = 10;
	String listSql = "select board_no, board_title, board_user, board_date from board order by board_no desc limit ?, ?";
	listStatement = connection.prepareStatement(listSql);
	listStatement.setInt(1, (currentPage-1)*pagePerRow);//-1을 함으로서 1패이지는 0행부터 10개를 샌다.
	listStatement.setInt(2, pagePerRow);
	listResultSet = listStatement.executeQuery();
%>
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
			while(listResultSet.next()) {
%>
				<tr>
					<td><a href="<%=request.getContextPath()%>/jsp_board/boardView.jsp?boardNo=<%=listResultSet.getInt("board_no")%>"><%=listResultSet.getString("board_title")%></a></td>
					<td><%=listResultSet.getString("board_user")%></td>
					<td><%=listResultSet.getString("board_date")%></td>
				</tr>
<%        
			}
%>
		</tbody>
	</table>
	<div>
		<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/jsp_board/boardAddForm.jsp">게시글 입력</a>		
	</div>
<%

	//lastPage는 전체 게시글의 수와 페이지당 보여줄 게시글을 지정한 숫자를 나누어서 0으로 떨어지지 않으면 lastPage를 1더한다.
	int lastPage = totalRowCount/pagePerRow;
	if(totalRowCount % pagePerRow != 0) {
		lastPage++;
	}
%>
	<div>
<%
		if(currentPage>1) { // 현재 페이지가 1페이지보다 크면 이전페이지 링크를 추가
%>
			<a type="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?currentPage=<%=currentPage-1%>">이전</a>
<%
		}
		if(currentPage < lastPage) { // 현재 페이지가 마지막 페이지보다 작으면 다음페이지 링크를 추가
%>
			<a type="button" class="btn btn-outline-info" href="<%=request.getContextPath()%>/jsp_board/boardList.jsp?currentPage=<%=currentPage+1%>">다음</a>
<%
		}
%>
	</div>
<%
	} catch(Exception e) {
		e.printStackTrace();
		out.print("게시판 목록 가져오기 실패!");
	} finally {
		try {totalResultSet.close();} catch(Exception e){}
		try {listResultSet.close();} catch(Exception e){}
		try {totalStatement.close();} catch(Exception e){}
		try {listStatement.close();} catch(Exception e){}
		try {connection.close();} catch(Exception e){}
    }
%>
</body>
</html>