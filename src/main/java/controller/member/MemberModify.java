package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;

@WebServlet("/member/modify")
public class MemberModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("id");
		
		if(session_id == null) {	//로그인 전
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print("alert('잘못된 경로입니다.');");
			out.print("history.back();");
			out.print("</script>");
		}else {	//로그인 후
			MemberDAO dao = new MemberDAO();
			Member m = dao.oneMember(session_id);	//회원정보 가져오기
			
			request.setAttribute("modify", m); //객체 modify를 modify.jsp로 forward() 시킨다.
			RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
			dis.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		
		Member m = new Member();	//dto 패키지에 있는 Member.java
		// <form>넘어온 변수들을 객체에 담는다.
		m.setId(request.getParameter("mb_id"));	
		m.setPass(request.getParameter("mb_pass"));
		m.setName(request.getParameter("mb_name"));
		m.setEmail(request.getParameter("mb_email"));
		m.setAge(Integer.parseInt(request.getParameter("mb_age")));
		m.setGender(request.getParameter("mb_gender"));
		m.setMemo(request.getParameter("mb_memo")); 
		m.setStatus("정상");
		m.setSigndate(signdate);
		
		MemberDAO dao = new MemberDAO();
		
		dao.updateMember(m);	//회원수정
		
		response.sendRedirect("/");	//페이지 이동
	}

}
