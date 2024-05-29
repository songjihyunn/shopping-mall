package controller.order;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.OrderDAO;
import dto.Member;
import dto.Order;


@WebServlet("/order/write")
public class Orderwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Orderwrite() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("write.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
	
			// 오늘 날짜
			java.util.Date today = new java.util.Date();
			SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String signdate = cal.format(today);
	
			OrderDAO dao = new OrderDAO();
			MemberDAO dao_m = new MemberDAO();
	
			Member m = dao_m.oneMember((String) session.getAttribute("id"));
			Order o = new Order();
	
			o.setOd_id((String)session.getAttribute("cart"));
			o.setOd_price(Integer.parseInt(request.getParameter("it_price")));
			o.setCt_status("준비");
			o.setOd_date(signdate);
			o.setMb_id((String)session.getAttribute("id"));
			o.setMb_name(m.getName());
			o.setMb_email(m.getEmail());
			o.setIt_size(request.getParameter("it_size"));
			o.setOd_option("");
			o.setOd_image(request.getParameter("file1"));
			o.setOd_name(request.getParameter("it_name"));
			o.setIt_point(Integer.parseInt(request.getParameter("it_point")));
			o.setIt_qty(Integer.parseInt(request.getParameter("it_qty")));

	
	
	
			//System.out.println(item.toString());
			dao.insertOrder(o); 
	
			response.sendRedirect("list");
	}

}
