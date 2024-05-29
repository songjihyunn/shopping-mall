package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.Member;

@WebServlet("/member/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("mb_id");
		String pass = request.getParameter("mb_password");

		MemberDAO dao = new MemberDAO();

		int num = dao.loginSelect(id); //아이디 존재여부

		//출력 구문
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		if(num == 1) { //아이디 존재
			Member m = dao.loginMemberSelect(id, pass); //회원정보
			if(m.getId() != null) { //아이디.비밀번호 매칭 성공
				// 세션 생성
				HttpSession session = request.getSession();

				session.setAttribute("id", m.getId());
				session.setAttribute("name", m.getName());
				session.setAttribute("level", m.getLevel());

				response.sendRedirect("/"); 
			}else {
				out.print("<script>");
				out.print("alert('비밀번호가 틀렸습니다.');");
				out.print("history.back();");
				out.print("</script>");
			}
		}else {			
			out.print("<script>");
			out.print("alert('없는 아이디입니다.');");
			out.print("history.back();");
			out.print("</script>");
		}
	}
}