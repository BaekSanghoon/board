<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model2.Board" %>
<!DOCTYPE html>
<html>
<head>
<title>board modify from</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 부트 스트랩 CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script>
	//jQuery를 이용한 유효성 검사
    $(document).ready(function(){
		$('#addButton').click(function(){
			if($('#boardPw').val().length <4) {//4자 이상
				alert('페스워드는 4자이상 이어야 합니다');
				$('#boardPw').focus();
			} else if($('#boardTitle').val()=='') { //공백문자불가
				alert('게시글 제목을 입력하세요');
				$('#boardTitle').focus();
			} else if($('#boardContent').val()=='') {//공백문자불가
				alert('게시글을 입력하세요');
				$('#boardContent').focus();
			} else if($('#boardUser').val()=='') {//공백문자불가
				alert('게시글 아이디를 입력하세요');
				$('#boardUser').focus();
			} else {
				$('#addForm').submit();
			}
		});
    });
</script>
</head>
<body>
<div class="container">		
<%
    Board board = (Board)request.getAttribute("board");
%>   
	<h1>게시글 수정하기(모델1)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/model2_board/BoardModifyServlet.do" method="post">
		<div class="table-active" > 게시글 번호 </div>
		<div class="table-active"><input name="boardNo" value="${board.boardNo}" type="text" readonly="readonly"/></div>
		<div class="table-light">게시글 암호</div>
		<div class="table-light"><input name="boardPw" id="boardPw" type="password"/></div>
		<div class="table-active">게시글 제목</div>
		<div class="table-active"><input name="boardTitle" value="${board.boardTitle}" id="boardTitle" type="text"/></div>
		<div class="table-light">게시글 내용</div>
		<div class="table-light" ><textarea name="boardContent" id="boardContent" rows="5" cols="50">${board.boardContent}</textarea></div>
		<div class="table-active">
            <input class="btn btn-outline-success"  type="submit" id="addButton" value="글수정"/>
            <input class="btn btn-outline-warning" type="reset" value="초기화"/>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/model2_board/boardListServlet.do">목록으로</a>
        </div>

    </form>
</div>
</body>
</html>