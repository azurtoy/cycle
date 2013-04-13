package cycle;

import java.util.List;
import java.lang.String;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cycle.PMF;
import model.Member;
import java.io.IOException;

@SuppressWarnings("serial")
public class MemberCheckCycleServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	//아디 값 받은거 그대로 doGet으로 보냄
    	doGet(request, response);
        }	
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//로그인 서블릿
	HttpSession session = request.getSession(); //세션세션
	response.setContentType("text/html;charset=utf-8"); //한글깨짐방지
	String id = request.getParameter("id");		//아디받고
	String password = request.getParameter("pwd");		//비번받고
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Query query = pm.newQuery(Member.class);
	query.setFilter("id == idParam"); //아디필터쿼리날료
	query.declareParameters("String idParam");
	try {
		@SuppressWarnings("unchecked")
		List<Member> results = (List<Member>) query.execute(id);//results로 저장
		//아이디가있고 비번이 같고 일반유저일때
		if( results.size() > 0 && results.get(0).getPassword().equals(password) && results.get(0).getAuthority().equals("user") ) {
			session.setAttribute("auth",results.get(0).getAuthority());
			session.setAttribute("id",results.get(0).getId()); //세션보내보내
			response.sendRedirect("../index.jsp"); //돌아감
		}
		//아이디가있고 비번이같고 관리자일때
		else if (results.size() > 0 && results.get(0).getPassword().equals(password) && results.get(0).getAuthority().equals("admin")) {
			session.setAttribute("auth", results.get(0).getAuthority());
			session.setAttribute("id",results.get(0).getId()); //세션보내보내
			response.sendRedirect("../index.jsp"); //돌아감
		}
		//꺼졍ㅋ
		else {
	         response.sendRedirect("../member/login.jsp"); //돌아감

	         
		}
		
	}finally {
	}
	 return;
}
}
