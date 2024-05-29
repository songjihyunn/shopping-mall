package admin.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminMemberDAO;
import dto.Member;

@WebServlet("/admin/member/modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Modify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		AdminMemberDAO dao = new AdminMemberDAO();
		
		Member m = dao.oneMember(id);
		
		request.setAttribute("m", m);
		
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		
		m.setId(request.getParameter("mb_id"));
		m.setPass(request.getParameter("mb_pass"));
		m.setName(request.getParameter("mb_name"));
		m.setEmail(request.getParameter("mb_email"));
		m.setAge(Integer.parseInt(request.getParameter("mb_age")));
		m.setGender(request.getParameter("mb_gender"));
		m.setLevel(request.getParameter("mb_level"));
		m.setMemo(request.getParameter("mb_memo"));
		m.setStatus(request.getParameter("mb_status"));
		m.setSigndate(request.getParameter("mb_signdate"));		
		
		AdminMemberDAO dao = new AdminMemberDAO();
		
		dao.updateMember(m); //회원수정
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print("<script>");
		out.print("opener.location.reload();"); //부모창 새로고침
		out.print("self.close();"); //자식창 닫기
		out.print("</script>");
	}

}








