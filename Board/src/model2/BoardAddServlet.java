package model2;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/model2_board/BoardAddServlet.do")
public class BoardAddServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
	

    // boardDao.insertBoard()메서드에 매개변수로 입력할 값을 설정
    Board board = new Board();
    board.setBoardPw(boardPw);
    board.setBoardTitle(boardTitle);
    board.setBoardContent(boardContent);
    board.setBoardUser(boardUser);
    
 	BoardDao boardDao = new BoardDao();   
	int row = boardDao.insertBoard(board);
    
	response.sendRedirect(request.getContextPath()+"/model1_board/boardList.jsp");
	}
}
