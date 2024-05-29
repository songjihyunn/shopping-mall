package controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminOrderDAO;
import dto.Order;


@WebServlet("/order/orderview")
public class Orderview extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Orderview() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		AdminOrderDAO dao = new AdminOrderDAO();
		Order o = dao.oneOrder(id);
		o.toString();
		request.setAttribute("o", o);
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
		dis.forward(request, response);
	}
}
