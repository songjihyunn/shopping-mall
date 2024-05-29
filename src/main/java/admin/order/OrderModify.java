package admin.order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminOrderDAO;
import dao.MemberDAO;
import dto.Member;
import dto.Order;

@WebServlet("/admin/order/modify")
public class OrderModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderModify() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id"); // "id" 파라미터 가져오기
        System.out.println("id: " + id); // 가져온 id 값 콘솔에 출력
        
        AdminOrderDAO dao = new AdminOrderDAO();
        
        Order o = dao.oneOrder(id); // id 값을 이용하여 Order 정보 조회
        
        request.setAttribute("o", o); // 조회된 Order 객체를 request 속성에 설정
        
        RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
        dis.forward(request, response); // modify.jsp로 포워딩
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Order o = new Order();
		MemberDAO dao_m = new MemberDAO();
		HttpSession session = request.getSession();
		Member m= dao_m.oneMember(request.getParameter("mb_id"));
		
		/*
		 * o.setMb_id(request.getParameter("mb_id"));
		 * o.setMb_email(request.getParameter("mb_email"));
		 * o.setMb_name(request.getParameter("mb_name"));
		 * o.setOd_date(request.getParameter("od_date"));
		 * o.setOd_id(request.getParameter("od_id"));
		 * o.setOd_image(request.getParameter("od_image"));
		 * o.setOd_name(request.getParameter("od_name"));
		 * o.setIt_size(request.getParameter("it_size"));
		 * o.setOd_price(Integer.parseInt(request.getParameter("od_price")));
		 * o.setCt_status(request.getParameter("ct_status"));
		 * o.setIt_point(Integer.parseInt(request.getParameter("it_size")));
		 */
		o.setOd_id(request.getParameter("od_id")); // od_id에 해당하는 값을 설정
		o.setOd_price(Integer.parseInt(request.getParameter("od_price"))); // od_price에 해당하는 값을 설정
		o.setCt_status(request.getParameter("ct_status")); // ct_status에 해당하는 값을 설정
		o.setOd_date(request.getParameter("od_date")); // od_date에 해당하는 값을 설정
		o.setMb_id(request.getParameter("mb_id")); // mb_id에 해당하는 값을 설정
		o.setMb_name(request.getParameter("mb_name")); // mb_name에 해당하는 값을 설정
		o.setMb_email(m.getEmail()); // mb_email에 해당하는 값을 설정
		o.setIt_size(request.getParameter("it_size")); // it_size에 해당하는 값을 설정
		o.setOd_option(request.getParameter("it_point")); // it_size에 해당하는 값을 설정
		o.setOd_image(request.getParameter("od_image")); // od_image에 해당하는 값을 설정
		o.setOd_name(request.getParameter("od_name")); // od_name에 해당하는 값을 설정
		System.out.println(o.toString());
		o.setIt_point(0); // it_point에 해당하는 값을 설정
		
		AdminOrderDAO dao = new AdminOrderDAO();
		System.out.println(o.toString());
		dao.updateOrder(o);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("opener.location.reload();"); //부모창 새로고침
		out.print("self.close();"); //자식창 닫기
		out.print("</script>");
	}

}
