package admin.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;


@WebServlet("/admin/item/itemcommentde")
public class ItemCommentDe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ItemCommentDe() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid =  Integer.parseInt(request.getParameter("tb_uid"));
		System.out.println("deuid"+uid);
		ReviewDAO dao = new ReviewDAO();
		dao.deleteRev(uid);
		response.sendRedirect("view?uid="+uid);
	}
}	
