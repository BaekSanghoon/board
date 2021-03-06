package model2;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/model2_board/BoardModifyServlet.do")
public class BoardModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) { //no 와 pw 값이 없을경우 리스트로 돌아간다.
    		response.sendRedirect(request.getContextPath()+"/model2_board/BoardListServlet.do");
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
    		response.sendRedirect(request.getContextPath()+"/model2_board/BoardViewServlet.do?boardNo="+boardNo);
    	}
    }
}
