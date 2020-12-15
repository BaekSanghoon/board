<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>board modify from</title>
</head>
<body>
<h1>게시글 수정하기</h1>
<%
	if(request.getParameter("boardNo") == null) { //no가 넘어오지 않으면 리스트로 이동
		response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("boardModify param boardNo:"+boardNo);
		String boardTitle = "";
		String boardContent = "";
        
		//DB연동
		String dbUrl = "jdbc:mariadb://127.0.0.1:3306/boardd";
		String dbUser = "root";
		String dbPw = "java1004";
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String selectSql = "select board_title, board_content from board where board_no=?";
			statement = connection.prepareStatement(selectSql);
			statement.setInt(1, boardNo);
			resultSet = statement.executeQuery();
			if(resultSet.next()) {
				boardTitle = resultSet.getString("board_title");
				boardContent = resultSet.getString("board_content");
			} else {
				response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("게시글 수정폼 에러 발생!");
		} finally {
			try {resultSet.close();} catch(Exception e){}
			try {statement.close();} catch(Exception e){}
			try {connection.close();} catch(Exception e){}
		}
%>    
		<form action="<%=request.getContextPath()%>/jsp_board/boardModifyAction.jsp" method="post">
			<div>boardNo : <input name="boardNo" value="<%=boardNo%>" type="text" readonly="readonly"/></div>
			<div>비밀번호확인: <input name="boardPw" id="boardPw" type="password"/></div>
			<div>boardTitle : <input name="boardTitle" value="<%=boardTitle%>" id="boardTitle" type="text"/></div>
			<div>boardContent : </div>
			<div><textarea name="boardContent" id="boardContent" rows="5" cols="50"><%=boardContent%></textarea></div>
			<div>
				<input type="submit" value="글수정"/>
				<input type="reset" value="초기화"/>
			</div>
		</form>
<%
	}    
%>
</body>
</html>