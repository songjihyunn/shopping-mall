package controller.cart;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import dto.Cart;
import dto.Member;
import dto.Order;


@WebServlet("/cart/Cartwrite")
public class Cartwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Cartwrite() {
        super();
        
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();

			// 오늘 날짜
			java.util.Date today = new java.util.Date();
			SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String signdate = cal.format(today);

			Order o = new Order();
			OrderDAO dao = new OrderDAO();
			MemberDAO dao_m = new MemberDAO();

			Member m = dao_m.oneMember((String) session.getAttribute("id"));

			/*
			 * o.setOd_id((String)session.getAttribute("cart")); // od_id에 해당하는 값을 설정
			 * o.setOd_price(Integer.parseInt(request.getParameter("it_price"))); //
			 * od_price에 해당하는 값을 설정 o.setCt_status("준비"); // ct_status에 해당하는 값을 설정
			 * o.setOd_date(signdate); // od_date에 해당하는 값을 설정
			 * o.setMb_id((String)session.getAttribute("id")); // mb_id에 해당하는 값을 설정
			 * o.setMb_name(m.getName()); // mb_name에 해당하는 값을 설정
			 * o.setMb_email(m.getEmail()); // mb_email에 해당하는 값을 설정 o.setIt_size("M"); //
			 * it_size에 해당하는 값을 설정 o.setOd_option(""); // it_size에 해당하는 값을 설정
			 * o.setOd_image(request.getParameter("file1")); // od_image에 해당하는 값을 설정
			 * o.setOd_name(request.getParameter("it_name")); // od_name에 해당하는 값을 설정
			 * o.setIt_point(Integer.parseInt(request.getParameter("it_point"))); //
			 * it_point에 해당하는 값을 설정
			 * 
			 * 
			 */
			Cart c = new Cart();

			c.setOd_id((String) session.getAttribute("cart"));
			c.setMb_id((String) session.getAttribute("id"));
			c.setIt_uid(request.getParameter("it_uid"));
			System.out.println(c.getCt_uid());
			c.setIt_price(Integer.parseInt(request.getParameter("it_price")));
			c.setIt_point(Integer.parseInt(request.getParameter("it_point")));
			c.setIt_qty(Integer.parseInt(request.getParameter("it_qty"))); // 구매수량
			c.setCt_status("준비");
			c.setCt_date(signdate);
			c.setFile1(request.getParameter("file1"));
			c.setIt_name(request.getParameter("it_name"));
			c.setIt_size(request.getParameter("it_size"));
			System.out.println(c.getOd_id());
			CartDAO dao1 = new CartDAO();
			// 장바구니 존재 여부
			int num = dao1.selectItem(c);
			System.out.println(c.toString());
			if (num == 0) {
				dao1.insertCart(c); // 장바구니 담기
			} else {
				dao1.oneUpdate(c);
			}
			String order = request.getParameter("order");

			if (order.equals("c")) { // 장바구니
				response.sendRedirect("list"); // 장바구니 목록 이동

			} else {// 바로구매
				response.sendRedirect("/cart/view");
				// 구매 페이지 이동 }
			}

		}
}

