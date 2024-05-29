package admin.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BbsDAO;


@WebServlet("/admin/bbs/delete")
public class BbsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BbsDelete() {
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
