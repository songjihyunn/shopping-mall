package controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mailSend")
public class MailSend extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MailSend() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");

        String receiver = request.getParameter("receiver");
        String subject = "이메일 인증 번호"; // 이메일 제목은 고정
        String content = generateVerificationCode(); // 랜덤으로 생성한 인증번호

        // Session 객체를 사용하여 이메일을 보내는 코드는 여기서부터
        String user = "jihyeonsong672@gmail.com";
        String password = "yqqzugcuuauriicr";

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();

        // 이메일 유효성 검사
        if (!isValidEmailAddress(receiver)) {
            out.print("유효하지 않은 이메일입니다.");
            return;
        }

        try {
            Properties p = new Properties();
            p.put("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.port", "587");

            Session s = Session.getInstance(p, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, password);
                }
            });

            Message m = new MimeMessage(s);
            Address receiver_address = new InternetAddress(receiver);

            m.setHeader("content-type", "text/html;charset=utf-8");
            m.addRecipient(Message.RecipientType.TO, receiver_address);
            m.setSubject(subject);
            m.setContent(content, "text/html;charset=utf-8");
            m.setSentDate(new Date());

            Transport.send(m);

            // 세션에 인증번호를 저장
            HttpSession session = request.getSession();
            session.setAttribute("verificationCode", content);

            response.setContentType("text/html; charset=utf-8");
            PrintWriter out1 = response.getWriter();

            // 응답으로 메일 전송 성공 메시지 전송
            out1.print("인증번호가 발송되었습니다.");
            // 클라이언트에게 알림 창을 표시
            out1.println("<script>alert('인증번호가 발송되었습니다.');</script>");

        } catch (Exception e) {
            e.printStackTrace();
            // 응답으로 메일 전송 실패 메시지 전송
            out.print("메일 전송에 실패했습니다.");
        }

    }

    // 랜덤으로 6자리 인증번호 생성하는 메서드
    private String generateVerificationCode() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append(random.nextInt(10)); // 0부터 9까지의 숫자 중 랜덤으로 선택
        }
        return sb.toString();
    }

    // 이메일 유효성 검사 메서드
    private boolean isValidEmailAddress(String email) {
        // 간단한 이메일 형식 검사를 수행할 수 있습니다.
        // 실제 이메일 형식 검증을 위해서는 정규식을 사용하는 것이 더 적합합니다.
        // 여기서는 예시로 '@' 문자가 포함되어 있는지만 확인합니다.
        return email.contains("@");
    }

}
