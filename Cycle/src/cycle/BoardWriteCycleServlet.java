package cycle;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import cycle.PMF;
import model.Board;

@SuppressWarnings("serial")
public class BoardWriteCycleServlet extends HttpServlet {
	//글쓰기 서블렛 - 대충 얜 끝난듯
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	//두겟은 없으면 오류나길래 일단 집어너봄
	}
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	//새로운글 저장
		String boardName = request.getParameter("boardName");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String user = request.getParameter("user");
    	Board board = new Board (boardName, subject, content, user);
        Date date = new Date(); 
        board.setPosttime(date); //날짜저장
        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
        	pm.makePersistent(board); //디비저장
        } finally {
        	pm.close();
        }
         response.sendRedirect("/board"); //돌아감
        return;
        }
}
