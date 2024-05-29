package controller.cart;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dto.Cart;


@WebServlet("/cart/view")
public class Cartviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Cartviews() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("ct_uid");
		System.out.println("uid:"+id);
		CartDAO dao = new CartDAO();
		Cart c = dao.oneCart(id);
		
		request.setAttribute("c", c);
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//insertorder 
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
	
		//오늘 날짜
		java.util.Date today = new java.util.Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		
		Cart c = new Cart();
		
		c.setOd_id((String)session.getAttribute("cart"));
		c.setMb_id((String)session.getAttribute("id"));
		c.setIt_uid(request.getParameter("it_uid")); 
		System.out.println("it_uid"+c.getIt_uid());
		c.setIt_price(Integer.parseInt(request.getParameter("it_price")));
		c.setIt_point(Integer.parseInt(request.getParameter("it_point")));
		c.setIt_qty(Integer.parseInt(request.getParameter("it_qty"))); //구매수량
		c.setCt_status("준비");
		c.setCt_date(signdate);
		c.setIt_name(request.getParameter("it_name"));
		c.setFile1(request.getParameter("file1"));
		c.setIt_size(request.getParameter("it_size"));
		System.out.println(c.getFile1());
		CartDAO dao = new CartDAO();
		
		//장바구니 존재 여부
		int num = dao.selectItem(c);
		System.out.println(c.toString());
//		if(num == 0) {
		dao.insertCart(c); //장바구니 담기
//		}else {
//			dao.oneUpdate(c);
//		}		
//		 String order = request.getParameter("order"); 

		/*if(order.equals("c")) { //장바구니			
*/			response.sendRedirect("/order/view.jsp?"); // 장바구니 목록 이동
		/*
		 * }else { //바로구매 response.sendRedirect("/admin/order/write"); // 구매 페이지 이동 }
		 */
 	}

}