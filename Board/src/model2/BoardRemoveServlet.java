package model2;
 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/model2_board/BoardRemoveServlet.do")
public class BoardRemoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("boardNo") == null || request.getParameter("boardPw") == null) {
            response.sendRedirect(request.getContextPath()+"/model2_board/BoardListServlet.do");
        } else {
            int boardNo = Integer.parseInt(request.getParameter("boardNo"));
            // System.out.println("boardNo :"+boardNo);
            String boardPw = request.getParameter("boardPw");
            // System.out.println("boardPw :"+boardPw);
            BoardDao boardDao = new BoardDao();
            if(boardDao.deleteBoard(boardNo, boardPw)==1){
                response.sendRedirect(request.getContextPath()+"/model2_board/BoardListServlet.do");
            } else {
                response.sendRedirect(request.getContextPath()+"/model2_board/boardRemoveForm.jsp?boardNo="+boardNo);
            }
        }
    }
}

