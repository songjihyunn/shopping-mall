package admin.bbs;

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

import dao.CommentDAO;
import dto.Bbs;
import dto.Comment;


@WebServlet("/admin/bbs/bbscommentin")
public class BbsCommentIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BbsCommentIn() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청의 문자 인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		String uid = request.getParameter("uid");
		String pageNum = request.getParameter("pageNum");
		String field = request.getParameter("field");
		String search = request.getParameter("search");
		search = URLEncoder.encode(search,"utf-8");
		
		// 오늘 날짜와 시간을 형식화
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		Bbs b = new Bbs();
		b.setUid(Integer.parseInt(request.getParameter("uid")));
		// Comment 객체 생성
		Comment com = new Comment();
		// HttpSession을 사용하여 세션에서 데이터 가져오기
		HttpSession session = request.getSession();
		
		// 매개변수 값 설정
		com.setTb_id((String)session.getAttribute("id"));
		com.setTb_name((String)session.getAttribute("name"));
		com.setUid(b.getUid()); 

		com.setTb_comment(request.getParameter("tb_comment"));
		com.setTb_date(signdate);

		
		/*
		 * com.setTbUid(Integer.parseInt(request.getParameter("tb_uid"))); // 예시로 추가한 필드
		 */
		// CommentDAO를 사용하여 데이터베이스 작업 수행
		CommentDAO dao = new CommentDAO();
		// dao.save(com); // 예시로 추가한 저장 메서드
		try {
		    dao.insertCom(com);
		} catch (Exception e) {
		  
		    e.printStackTrace();
		}
		// 데이터베이스 작업이 성공적으로 완료되었으면 리스트 페이지로 리다이렉트
		response.sendRedirect("view?uid="+uid+"&pageNum="+pageNum+"&field="+field+"&search="+search);
	}

}
