package model2;

import java.io.IOException;
import java.util.ArrayList;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/model2_board/BoardListServlet.do")
public class BoardListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int currentPage = 1;
        if(request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        

        BoardDao boardDao = new BoardDao();

        int totalRowCount = boardDao.getBoardCount();
        int pagePerRow = 10;
        ArrayList<Board> list = boardDao.getBoardList(currentPage, pagePerRow);
        
        int lastPage = totalRowCount/pagePerRow;
        if(totalRowCount % pagePerRow != 0) {
            lastPage++;
        }
        request.setAttribute("totalRowCount", totalRowCount);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("lastPage", lastPage);
        request.setAttribute("list", list);
 
        RequestDispatcher rd = request.getRequestDispatcher("/model2_board/boardList.jsp");
        rd.forward(request, response);
    }
}