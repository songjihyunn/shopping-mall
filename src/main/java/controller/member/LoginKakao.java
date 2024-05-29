package controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;

@WebServlet("/member/kakao")
public class LoginKakao extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginKakao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id  = request.getParameter("useremail");
		
		//오늘 날짜
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);

		MemberDAO dao = new MemberDAO();

		int num = dao.loginSelect(id); //아이디 존재여부

		if(num == 1) { //아이디 존재
			Member m = dao.oneMember(id); //회원정보

			HttpSession session = request.getSession();

			session.setAttribute("id", m.getId());
			session.setAttribute("name", m.getName());
			session.setAttribute("connecttype", m.getConnecttype());
			session.setAttribute("level", m.getLevel());
			session.setAttribute("status", m.getStatus());
			session.setAttribute("signdate", signdate);
		}else {
			dao.insertMemberApi(id, signdate);	//카카오 회원가입
			
			HttpSession session = request.getSession();

			session.setAttribute("id", id);
			session.setAttribute("connecttype", "카카오");
			session.setAttribute("level", "1");
			session.setAttribute("status", "정상");
			session.setAttribute("signdate", signdate);
		}
		response.sendRedirect("/member/modify");
	}

}
