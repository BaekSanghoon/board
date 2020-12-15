<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.BoardDao" %>
<!DOCTYPE html>
<html>
<head>
<title>boardRemoveAction</title>
</head>
<body>
<%
	
	if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) { // no 나 pw값이 없으면 리스트로 이동
		response.sendRedirect(request.getContextPath()+"/model1_board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		// System.out.println("boardNo :"+boardNo);
		String boardPw = request.getParameter("boardPw");
		// System.out.println("boardPw :"+boardPw);
        BoardDao boardDao = new BoardDao();
			if(boardDao.deleteBoard(boardNo, boardPw)==1){
				response.sendRedirect(request.getContextPath()+"/model1_board/boardList.jsp");
			} else {
				response.sendRedirect(request.getContextPath()+"/model1_board/boardRemoveForm.jsp?boardNo="+boardNo);
			}
	}
%>
</body>
</html>