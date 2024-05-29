package admin.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminOrderDAO;
import dto.Order;

@WebServlet("/admin/order/list")
public class OrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한 페이지당 출력 게시물 수
				int pageSize = 3;
				//현재 페이지
				int pageNum=1;
				if(request.getParameter("pageNum") != null && request.getParameter("pageNum").matches("\\d+")) {
				    pageNum = Integer.parseInt(request.getParameter("pageNum"));
				} else {
				    // pageNum 파라미터가 유효하지 않은 경우 기본값으로 설정
				    pageNum = 1; // 기본 페이지 번호 설정
				}

				// 세션에서 사용자 아이디 가져오기
				HttpSession session = request.getSession();
				String mb_id = (String) session.getAttribute("id");
				String mb_name = (String) session.getAttribute("name");
				System.out.println(mb_id);

				//검색어
				String field = request.getParameter("field");
				String search = request.getParameter("search");
				
				//날짜 버튼
				String startDate = request.getParameter("startDate");
		        String endDate = request.getParameter("endDate");
				
				AdminOrderDAO dao = new AdminOrderDAO();
				
				//전체 게시글 수
				int count = dao.getAllcount(field, search);
				System.out.println("count: " + count);

				//넘버링
				int number = count - (pageNum - 1) * pageSize;
				
				//현재 보여질 페이지  값 설정
				int startRow = (pageNum - 1) * pageSize;
				int endRow = pageSize;
				
				 ArrayList<Order> o;
			        if (startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {
			            // 날짜 조건이 있는 경우 필터링된 주문 목록 조회
			            o = dao.getFilteredOrders(startDate, endDate);
			        } else {
			            // 날짜 조건이 없는 경우 전체 주문 목록 조회
			            o = dao.getAllOrders(startRow, endRow, field, search);
			        }

				// 리스트가 비어있는지 확인
				 boolean isEmpty = true;
				 if (isEmpty) {
				     System.out.println("The list is empty.");
				 } else {
				     System.out.println("The list is not empty.");
				 }


				 request.setAttribute("o", o);
				 request.setAttribute("count", o.size());
				 request.setAttribute("number", number);
				 request.setAttribute("pageSize", pageSize);
				 request.setAttribute("pageNum", pageNum);
				 
				 request.setAttribute("isEmpty", true);
				 System.out.println("isEmpty: " + isEmpty);
				 
				 request.setAttribute("field", field);
				 request.setAttribute("search", search);
				 request.setAttribute("startDate", startDate);
				 request.setAttribute("endDate", endDate);
				 session.setAttribute("mb_id", mb_id);
				 session.setAttribute("mb_name", mb_name);
				
				 RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
				 dis.forward(request, response);
			}
}
