package controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/check_Number")
public class Check_Number extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Check_Number() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userCode = request.getParameter("verificationCode"); // 클라이언트에서 전송한 인증번호
        String sessionCode = (String) request.getSession().getAttribute("verificationCode"); // 세션에 저장된 인증번호
        
        System.out.println("클라이언트에서 전송한 인증번호: " + userCode);
        System.out.println("세션에 저장된 인증번호: " + sessionCode);
        
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        
        if (userCode != null && userCode.equals(sessionCode)) {
            // 클라이언트에게 알림 창을 표시합니다.
            out.println("인증되었습니다.");
            System.out.println("java 인증되었습니다."); // 결과를 콘솔에 출력합니다.
        } else {
            // 클라이언트에게 알림 창을 표시합니다.
            out.println("인증번호가 다릅니다.");
            System.out.println("java 인증번호가 다릅니다."); // 결과를 콘솔에 출력합니다.
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doGet 메서드와 동일한 내용을 수행합니다.
        doGet(request, response);
    }
}