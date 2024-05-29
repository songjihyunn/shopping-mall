package controller.item;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDAO;
import dto.Item;
import dto.Review;


@WebServlet("/item/itemreviewin")
public class ItemReviewIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ItemReviewIn() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 요청의 문자 인코딩 설정
		request.setCharacterEncoding("utf-8");
		// HttpSession을 사용하여 세션에서 데이터 가져오기

		HttpSession session = request.getSession();
		Item  i = new Item();
		

		
		String uid = request.getParameter("it_uid"); //item_uid
		System.out.println("it_uid"+uid);
		String pageNum = request.getParameter("pageNum");
		String field = request.getParameter("field");
		String search = request.getParameter("search");
		search = URLEncoder.encode(search,"utf-8");
		
		// 오늘 날짜와 시간을 형식화
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		
		
		// Comment 객체 생성
		Review rev = new Review();
		// HttpSession을 사용하여 세션에서 데이터 가져오기
	
		// 매개변수 값 설정
		rev.setTb_id((String)session.getAttribute("id"));
		rev.setTb_name((String)session.getAttribute("name"));
		rev.setUid(Integer.parseInt(request.getParameter("it_uid")));
		rev.setTb_comment(request.getParameter("tb_comment"));
		rev.setTb_date(signdate);
		
		System.out.println(rev.toString());
		
		
		ReviewDAO dao = new ReviewDAO();
		
		try {
		    dao.insertRev(rev);
		} catch (Exception e) {
		  
		    e.printStackTrace();
		}
	
		response.sendRedirect("ItemView?it_uid="+uid+"&pageNum="+pageNum+"&field="+field+"&search="+search);
	}

}
