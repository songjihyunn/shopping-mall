package controller.bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import dao.CommentDAO;
import dto.Bbs;
import dto.Comment;


@WebServlet("/bbs/view")
public class Bbsviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Bbsviews() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		System.out.println("uid: "+uid);
		String pageNum = request.getParameter("pageNum");
		String field = request.getParameter("field");
		String search =  request.getParameter("search");
		// `BbsDAO` 클래스의 인스턴스를 생성하여 데이터베이스 관련 작업을 수행할 수 있도록 함.
		BbsDAO dao1 = new BbsDAO();

		// `uid`를 사용하여 `BbsDAO`의 `oneBbs()` 메서드를 호출하고, 결과로 반환된 `Bbs` 객체를 `b`에 저장함.
		Bbs b = dao1.oneBbs(uid);
		// `Bbs` 객체 `b`를 `request` 객체에 속성으로 설정하여 이후의 작업에서 사용할 수 있도록 함.
		request.setAttribute("b", b);
		//한 페이지 보여질 글의 갯수
		int pageSize = 10;
				
		//현재 보여지는 페이지의 넘버 값 처리
		int pageNum1 = 1;
		if(request.getParameter("pageNum") != null) {
			pageNum1 = Integer.parseInt(request.getParameter("pageNum"));
		}

		//전체 게시글 갯수 초기화
		int count = 0;

		//페이지 내에서 보여질 넘버링 숫자 처리 초기화
		int number = 0;

		CommentDAO dao = new CommentDAO();
		Comment com = new Comment();
		
		
		//전체 게시글 수
		count = dao.getAllcount(field, search, uid);

		//현재 보여질 페이지 limit 값 설정
		int startRow = (pageNum1 - 1) * pageSize;
		int endRow = pageSize;

		ArrayList<Comment> v = dao.getAllcom(startRow, endRow, field, search, uid);

		//넘버링 숫자
		number = count - (pageNum1 - 1) * pageSize;

		request.setAttribute("v", v);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("field", field);
		request.setAttribute("uid", uid);
		
		request.setAttribute("search", search);
		System.out.println("v: "+v);
		System.out.println("후 왜 안되냐:"+dao.getAllcount(field, search, uid));
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
		dis.forward(request, response);
	}

}
