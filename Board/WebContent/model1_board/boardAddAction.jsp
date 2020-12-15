<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Board" %>
<%@ page import="model.BoardDao" %>
<%
	//인코딩 설정
	request.setCharacterEncoding("UTF-8");

	String boardPw = request.getParameter("boardPw");
	//System.out.println("boardPw"+boardPw);
	String boardTitle = request.getParameter("boardTitle");
	//System.out.println("boardTitle"+boardTitle);
	String boardContent = request.getParameter("boardContent");
	//System.out.println("boardContent"+boardContent);	
	String boardUser = request.getParameter("boardUser"); 
	//System.out.println("boardUser"+boardUser);
	
	BoardDao boardDao = new BoardDao();
    // boardDao.insertBoard()메서드에 매개변수로 입력할 값을 설정
    Board board = new Board();
    board.setBoardPw(boardPw);
    board.setBoardTitle(boardTitle);
    board.setBoardContent(boardContent);
    board.setBoardUser(boardUser);
    
	int row = boardDao.insertBoard(board);
    
	response.sendRedirect(request.getContextPath()+"/model1_board/boardList.jsp");
%>
