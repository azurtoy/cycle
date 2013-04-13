package cycle;

import java.util.List;
import java.util.regex.*;
import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import cycle.PMF;
import model.Board;

@SuppressWarnings("serial")
public class BoardCycleServlet extends HttpServlet {
	
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	doGet(request, response);
    		//없으면 오류나길래 안지운거
    	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8"); //한글깨짐방지
		
		

		if(true) {
			getList(request, response); // 나중에 나눠볼라고 일단 메소드로 만들어봄
		}
	}
    



public void getList(HttpServletRequest request, HttpServletResponse response) throws IOException {
	//게시판 글목록 받아오는거 
	//String boardName = "UpdateNews";		//나중엔 리퀘스트파라미터 해서 이름 받아올거임
	String boardName = request.getParameter("boardName");
	String menuName = request.getParameter("menuName");
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Query query = pm.newQuery(Board.class);
	query.setFilter("boardName == boardNameParam"); //게시판 이름으로 필터생성
	query.declareParameters("String boardNameParam");

	try {
		@SuppressWarnings("unchecked")
		List <Board> results = (List<Board>)  query.execute(boardName); //게시판 이름으로 필터링
		if(results.size()>0) 
		{	request.setAttribute("test_board", results); //계속 찾아서 뿌림
		}
		String url = "/"+menuName + "/"+boardName+".jsp"; //돌아감 (이것도 나중에 +boardName 이런거 하면서 플렉시블하게 할거
		try {
		request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
		e.printStackTrace();      	
	}
	}finally {
		query.closeAll();
	}
	 return;
}

}
