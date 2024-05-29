package admin.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminOrderDAO;

@WebServlet("/admin/order/delete")
public class OrderDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		AdminOrderDAO dao = new AdminOrderDAO();
		
		dao.deleteOrder(id);
		
		response.sendRedirect("list");
	}

}