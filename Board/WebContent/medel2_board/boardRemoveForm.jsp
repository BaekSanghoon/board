<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardRemoveForm</title>
<!-- 부트 스트랩 CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#removeButton').click(function(){
			if($('#boardPw').val().length <4) {
				alert('페스워드는 4자이상 이어야 합니다');
				$('#boardPw').focus();
			} else {
				$('#removeForm').submit();
			}
		});
	});
</script>
</head>
<body>
<div class="container">
    <c:if test="${param.boardNo == null}"> <!-- no값이 없으면 리스트로 이동 -->
        <c:redirect url="/model2_board/BoardListServlet.do"/>    
    </c:if>
    
    <c:if test="${param.boardNo != null}">		
		<h1>게시글 삭제 비밀번호 확인(모델2)</h1>
			<form action="${pageContext.request.contextPath}/model2_board/boardRemoveServlet.do" method="post">
			
				<div>게시글 번호 : <input name="boardNo" value="${param.boardNo}" readonly/></div>
				<div>비밀번호 :  <input name="boardPw" type="password"></div>
				<div>
					<input class="btn btn-outline-danger" type="submit" value="삭제"/>
					<input class="btn btn-outline-warning"type="reset" value="초기화"/>
				</div>
			</form>
	</c:if>
</div>	
	
</body>
</html>