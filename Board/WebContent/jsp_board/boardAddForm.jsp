<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardAddForm</title>
</head>
<body>
	<h1>게시판 글입력</h1>
	<form action="<%=request.getContextPath()%>/jsp_board/boardAddAction.jsp" method="post">
	<div>게시글 작성자 이름</div>
	<div><input name="boardUser" id="boardUser" type="text"/></div>
	<div>게시글 암호</div>
	<div><input name="boardPw" id="boardPw" type="password"/></div>
	<div>게시글 제목</div>
	<div><input name="boardTitle" id="boardTitle" type="text"/></div>
	<div>게시글 내용</div>
	<div><textarea name="boardContent" id="boardContent" cols="50" rows="10"></textarea></div>
	<div>
		<!-- 입력받은데이터 서버로 전송하기  -->
		<input type="submit" value="글입력"/>
		<!-- 입력내용 초기화 --> 
		<input type="reset" value="초기화"/>
	</div>
	</form>
</body>
</html>