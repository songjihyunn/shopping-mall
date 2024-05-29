package controller.cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;

/**
 * Servlet implementation class Cartdelete
 */
@WebServlet("/cart/delete")
public class Cartdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Cartdelete() {
        super();
      
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ct_uid = Integer.parseInt(request.getParameter("ct_uid"));
		CartDAO dao = new CartDAO();
		dao.deleteCart(ct_uid);
		RequestDispatcher dis = request.getRequestDispatcher("/cart/list");
		dis.forward(request, response);		

	}

}
