package model2;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/model2_board/BoardModifyFormServlet.do")
public class BoardModifyFormServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	if(request.getParameter("boardNo") == null) {//no가 넘어오지 않으면 리스트로 이동
        	response.sendRedirect(request.getContextPath()+"/model2_board/BoardListServlet.do");
        } else {
        	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
        	//System.out.println("boardModify param boardNo:"+boardNo);
                
            BoardDao boardDao = new BoardDao();
            Board board = boardDao.getBoard(boardNo);
            request.setAttribute("board", board);

            RequestDispatcher rd = request.getRequestDispatcher("/model2_board/boardModifyForm.jsp");
            rd.forward(request, response);
        }
	}
}

