<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.BoardDao" %>
<%@ page import="model.Board" %>
<!DOCTYPE html>
<html>
<head>
<title>board modify Action</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) { //no 와 pw 값이 없을경우 리스트로 돌아간다.
		response.sendRedirect(request.getContextPath()+"/model1_board/boardList.jsp");
	} else {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		//System.out.println("boardModifyAction param boardNo :"+boardNo);
        String boardPw = request.getParameter("boardPw");
		//System.out.println("boardModifyAction param boardPw :"+boardPw);
		String boardTitle = request.getParameter("boardTitle");
		//System.out.println("boardModifyAction param boardTitle :"+boardTitle);
		String boardContent = request.getParameter("boardContent");
		//System.out.println("boardModifyAction param boardContent :"+boardContent);
        
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setBoardPw(boardPw);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		
		BoardDao boardDao = new BoardDao();
		boardDao.updateBoard(board);
		response.sendRedirect(request.getContextPath()+"/model1_board/boardView.jsp?boardNo="+boardNo);
	}
%>
</body>
</html>