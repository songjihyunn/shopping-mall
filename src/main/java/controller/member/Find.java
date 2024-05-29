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

@WebServlet("/member/find")
public class Find extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Find() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("find.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String btn = request.getParameter("btn");

	    MemberDAO dao = new MemberDAO();
	    
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    if("btn_id".equals(btn)) {
	    	String name = request.getParameter("mb_name");
	    	//System.out.println("name:" + name);
	    	
		    String email = request.getParameter("mb_email");
		    //System.out.println("email:" + email);
		    
		    Member user = dao.findUserId(name, email); // 이름과 이메일을 사용하여 아이디를 조회
		    //System.out.println("User: " + user);
		    
		    request.setAttribute("user", user);
		    
		    if(user.getId() != null) {
		    	out.println("<script>alert('아이디는 " + user.getId() + " 입니다.');");
		        out.print("history.back();</script>");
		    }else{
		    	out.println("<script>alert('존재하지 않는 사용자입니다.');");
		        out.print("history.back();</script>");
		    }
		    

	    }if("btn_pass".equals(btn)) {
	    	String id = request.getParameter("mb_id");
	    	//System.out.println("id:" + id);
	    	
		    Member userpass = dao.findUserPass(id);
		    //System.out.println("userpass:" + userpass);
		    
		    request.setAttribute("userpass", userpass);
		    
		    if(userpass.getPass() != null) {
		    	out.println("<script>alert('비밀번호는 " + userpass.getPass() + " 입니다.');");
		        out.print("history.back();</script>");
		    }else {
		    	out.println("<script>alert('존재하지 않는 아이디입니다.');");
		        out.print("history.back();</script>");
		    }
		    
	    }

	}

}
