package model2;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/model2_board/BoardViewServlet.do")
public class BoardViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int boardNo = 0;
        if(request.getParameter("boardNo") == null) {
            response.sendRedirect(request.getContextPath()+"/model2_board/boardListServlet.do");
        } else {
            boardNo = Integer.parseInt(request.getParameter("boardNo"));
            System.out.println("boardNo :"+boardNo);
            BoardDao boardDao = new BoardDao();
            Board board = boardDao.getBoard(boardNo);
            request.setAttribute("board", board);
            RequestDispatcher rd = request.getRequestDispatcher("/model2_board/boardView.jsp");
            rd.forward(request, response);
        }
    }
}
