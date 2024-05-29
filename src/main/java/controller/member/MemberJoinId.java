package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/member/id_ok")
public class MemberJoinId extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberJoinId() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		//System.out.println(id); 아이디 넘어 오는 것 확인
		MemberDAO dao = new MemberDAO();
		
		int num = dao.loginSelect(id);	//존재여부 확인
		String msg = "";
		
		if(num == 4) {	//아이디 입력 값이 4자리 미만일경우
			msg = "4";
		}else if(num == 1) {	//아이디가 존재할 경우
			msg = "1";
		}else {	//회원가입 가능 아이디
			msg = "0";
		}
		
		PrintWriter out = response.getWriter();
		out.print(msg);
	}

}
