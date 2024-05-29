package controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.Member;

@WebServlet("/member/join")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberJoin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("join.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//오늘 날짜
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		
		Member m = new Member();	
		
		m.setId(request.getParameter("mb_id"));	
		m.setPass(request.getParameter("mb_pass"));
		m.setName(request.getParameter("mb_name"));
		m.setEmail(request.getParameter("mb_email"));
		m.setAge(Integer.parseInt(request.getParameter("mb_age")));
		m.setGender(request.getParameter("mb_gender"));
		m.setLevel("1"); //레밸 1
		m.setMemo(request.getParameter("mb_memo")); 
		m.setStatus("정상");
		m.setSigndate(signdate);
		
		MemberDAO dao = new MemberDAO();
		
		dao.insertMember(m);	//회원가입
		
		response.sendRedirect("/");	//페이지 이동
	}

}
