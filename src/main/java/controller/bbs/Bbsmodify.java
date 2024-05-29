package controller.bbs;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import dto.Bbs;


@WebServlet("/bbs/modify")
public class Bbsmodify extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Bbsmodify() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get1호출");

		int uid = Integer.parseInt(request.getParameter("uid"));
		BbsDAO dao = new BbsDAO();
		Bbs b = dao.oneBbs(uid);
		request.setAttribute("b", b);
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		System.out.println("get2호출");
		System.out.println(b.toString());


		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Bbs b = new Bbs();
		System.out.println("post호출:"+b.toString());
		System.out.println(request.getParameter("uid"));
		System.out.println("제목:"+request.getParameter("subject"));
		b.setUid(Integer.parseInt(request.getParameter("uid")));  // `uid` 필드에 정수 값 설정
		b.setId(request.getParameter("id"));  // `id` 필드에 문자열 값 설정
		b.setName(request.getParameter("name"));  // `name` 필드에 문자열 값 설정
		b.setSubject(request.getParameter("subject"));  // `subject` 필드에 문자열 값 설정
		b.setComment(request.getParameter("comment"));  // `comment` 필드에 문자열 값 설정
		b.setSigndate(request.getParameter("signdate"));  // `signdate` 필드에 문자열 값 설정
		b.setRef(0);  // `ref` 필드에 정수 값 설정
		b.setGongji(request.getParameter("gongji"));  // `gongji` 필드에 문자열 값 설정
		b.setFile1(/* request.getParameter("file1") */" ");  // `file1` 필드에 문자열 값 설정
		b.setFile1_o(/* request.getParameter("file1_o") */" ");  // `file1_o` 필드에 문자열 값 설정
		b.setFile1_s(/* request.getParameter("file1_s") */" ");  // `file1_s` 필드에 문자열 값 설정
		b.setFid(0);  // `fid` 필드에 정수 값 설정
		b.setThread(" ");  // `thread` 필드에 문자열 값 설정
		System.out.println("post2 제출:"+b.toString());
		BbsDAO dao = new BbsDAO();
		dao.updateBbs(b); 
		


		/*
		 * response.sendRedirect("modify?it_uid="+item.getIt_uid()+"&pageNum="+pageNum+
		 * "&field="+field+"&search="+search);
		 */
		response.sendRedirect("list");		
	}

}

