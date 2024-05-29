package admin.member;

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

import dao.AdminMemberDAO;
import dao.MemberDAO;
import dto.Member;

@WebServlet("/admin/member/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Write() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("write.jsp");
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
		m.setLevel(request.getParameter("mb_level"));
		m.setMemo(request.getParameter("mb_memo"));
		m.setStatus("정상");
		m.setSigndate(signdate);
		
		AdminMemberDAO dao = new AdminMemberDAO();
		
		//아이디 존재여부		
		int num = dao.loginSelect(m.getId());
		System.out.println("똑띠 하자:"+num);
		if(num == 1) { //이미 존재하는 아이디
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('이미 존재하는 아이디입니다.');");
			out.print("history.back();");
			out.print("</script>");
		}else { //가입 가능한 아이디
			dao.insertMember(m); //회원가입
			
			response.sendRedirect("list");
		}		
	}

}




