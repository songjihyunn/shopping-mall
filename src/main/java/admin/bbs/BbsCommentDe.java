package admin.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;


@WebServlet("/admin/bbs/bbscommentde")
public class BbsCommentDe extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BbsCommentDe() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid =  Integer.parseInt(request.getParameter("tb_uid"));
		int uid1 =  Integer.parseInt(request.getParameter("uid"));

		System.out.println("deuid"+uid);
		CommentDAO dao = new CommentDAO();
		dao.deleteCom(uid);
		response.sendRedirect("view?uid="+uid1);
		
	}


}
