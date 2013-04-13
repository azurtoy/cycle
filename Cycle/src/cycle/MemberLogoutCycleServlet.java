package cycle;

import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
public class MemberLogoutCycleServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	//필요없엉ㅋ;
        }	
    
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//로그아웃할거임
	HttpSession session = request.getSession(false); //세션세션
	response.setContentType("text/html;charset=utf-8"); //한글깨짐방지
	session.invalidate(); //세션날려버려
	response.sendRedirect("../index.jsp"); //돌아감
		
	 return;
}
}
