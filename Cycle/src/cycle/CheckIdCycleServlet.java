package cycle;

import java.util.List;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cycle.PMF;
import model.Member;
import java.io.IOException;

@SuppressWarnings("serial")
public class CheckIdCycleServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	//id값 받은거 그대로 doGet으로 보냄
    if(request.getParameter("id")!=null)
    	doGet(request, response);
    }	
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//게시판 내용 출력 서블릿
	response.setContentType("text/html;charset=utf-8"); //한글깨짐방지
	String id = request.getParameter("id"); //아이디 받고
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Query query = pm.newQuery(Member.class); //쿼리만듬
	query.setFilter("id == idParam");	//아이디 있는지 체크하는걸로
	query.declareParameters("String idParam");
	String url = "/member/join.jsp"; //여기로 보냄
	try {
		@SuppressWarnings("unchecked")
		List<Member> results = (List<Member>) query.execute(id);
		if(!results.isEmpty())		{
		    request.setAttribute("id_check", "fail"); //아이디 중복
		    request.setAttribute("id", ""); //아이디 null값 보냄
			try {
				request.getRequestDispatcher(url).forward(request, response);
				} catch (ServletException e) {
				e.printStackTrace();   
				}
		}
		else {
			request.setAttribute("id_check","success"); // 아이디 없음. 노중복
			request.setAttribute("id", id); //아이디값 보냄
			try {
			request.getRequestDispatcher(url).forward(request, response);
			} catch (ServletException e) {
			e.printStackTrace();   
			}
		}
	}finally {
	}
	 return;
}
}