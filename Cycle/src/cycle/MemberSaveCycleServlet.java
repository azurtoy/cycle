package cycle;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import cycle.PMF;
import model.Member;

@SuppressWarnings("serial")
public class MemberSaveCycleServlet extends HttpServlet {
	//글쓰기 서블렛 - 대충 얜 끝난듯
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8"); //한글깨짐방지
    	//두겟은 없으면 오류나길래 일단 집어너봄
	}
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.setContentType("text/html;charset=utf-8"); //한글깨짐방지 	
    	//새로운글 저장
		String id = request.getParameter("id");
		String password = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");		
    	Member member = new Member (id, password);
    	member.setName(name);
    	member.setEmail(email);
    	member.setAddress(address);
    	member.setPhone(phone);
    	member.setMobile(mobile);
    	Date date = new Date(); 
        member.setInDate(date); //날짜저장
        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
        	pm.makePersistent(member); //디비저장
        } finally {
        	pm.close();
        }
         response.sendRedirect("/index.jsp"); //돌아감
        return;
        }
}
