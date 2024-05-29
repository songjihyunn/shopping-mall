package controller.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;


@WebServlet("/bbs/delete")
public class Bbsdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Bbsdelete() {
        super();
      
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid =  Integer.parseInt(request.getParameter("uid"));
		BbsDAO dao = new BbsDAO();
		dao.deleteBbs(uid);
		
		response.sendRedirect("list");
		
		System.out.println("post1 호출");

	}

}
