<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardRemoveForm</title>
</head>
<body>
<%
	
	if(request.getParameter("boardNo") == null) { // no값이 없으면 리스트로 이동
		response.sendRedirect(request.getContextPath()+"/jsp_board/boardList.jsp");
	} else {
%>
		<form action="<%=request.getContextPath()%>/jsp_board/boardRemoveAction.jsp" method="post">
		
			<div>게시물 번호 : <input name="boardNo" value="<%=request.getParameter("boardNo")%>" readonly/></div>
			<div>비밀번호확인 :  <input name="boardPw" type="password"></div>
			<div>
				<input type="submit" value="삭제"/>
				<input type="reset" value="초기화"/>
			</div>
		</form>
<%    
	}
%>
</body>
</html>