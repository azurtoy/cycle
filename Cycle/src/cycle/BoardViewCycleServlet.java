package cycle;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cycle.PMF;
import model.Board;
import java.io.IOException;

@SuppressWarnings("serial")
public class BoardViewCycleServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	//seq 값 받은거 그대로 doGet으로 보냄
    	doGet(request, response);
        }	
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//게시판 내용 출력 서블릿
	response.setContentType("text/html;charset=utf-8"); //한글깨짐방지
	Long seq = Long.parseLong(request.getParameter("seq"));		//게시물 번호 받고
	PersistenceManager pm = PMF.get().getPersistenceManager();
	try {
		Board results = pm.getObjectById(Board.class, seq); //seq값 같은거 다 results로 저장
		request.setAttribute("test_board", results); //뿌림
		String url = "/notice/update_news_view.jsp"; //여기로 보냄
		try {
		request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
		e.printStackTrace();      	
	}
	}finally {
	}
	 return;
}
}
