package admin.bbs;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import dto.Bbs;

	

@WebServlet("/admin/bbs/list")
public class BbsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BbsList() {
    	super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				//검색어
				String field = request.getParameter("field");
				String search = request.getParameter("search");		
				BbsDAO dao = new BbsDAO();
				Bbs b = new Bbs();
				//한 페이지당 출력 게시물 수
				int pageSize = 5;

				//현재 페이지
				int pageNum = 1;
				if(request.getParameter("pageNum") != null) {
					pageNum = Integer.parseInt(request.getParameter("pageNum"));
				}
				//전체 게시글 수
				int count = dao.getAllcount(field,search);				
				//넘버링
				int number = count - (pageNum - 1) * pageSize;
				//현재 보여질 페이지 limit 값 설정
				int startRow = (pageNum - 1) * pageSize;
				int endRow = pageSize;
				ArrayList<Bbs> v = dao.getAllBbs(startRow,endRow,field,search);
				request.setAttribute("v", v);
				request.setAttribute("count", count);
				request.setAttribute("number", number);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("field", field);
				request.setAttribute("search", search);
				
				
				RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
				dis.forward(request, response);
		
	}

}
