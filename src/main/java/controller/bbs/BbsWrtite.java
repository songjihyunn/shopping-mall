package controller.bbs;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BbsDAO;
import dto.Bbs;


@WebServlet("/bbs/write")
public class BbsWrtite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BbsWrtite() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dis = request.getRequestDispatcher("write.jsp");
		dis.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청의 문자 인코딩 설정
		request.setCharacterEncoding("utf-8");
		// 오늘 날짜와 시간을 형식화
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);

		// Bbs 객체 초기화
		Bbs b = new Bbs();		
		
		HttpSession session = request.getSession();
		//저장 경로 (사용자 item 폴더에 저장 처리)
		String uploadPath="D:\\jsp_academy\\teampro\\src\\main\\webapp\\upload_item";
		int size=10*1024*1024;

		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		// 매개변수 값 설정
		b.setId((String)session.getAttribute("id"));
	    b.setName((String)session.getAttribute("name"));
	    b.setSubject(multi.getParameter("subject"));
	    b.setComment(multi.getParameter("comment"));
	    b.setSigndate(signdate);
	    //b.setRef(0); //조회수
	    b.setGongji(multi.getParameter("gongji"));
	    b.setFile1_o("");
	    b.setFile1_s("");
	    b.setThread("A");
	    
	    
	    Enumeration files=multi.getFileNames();
	    
	    String file1 = (String)files.nextElement();
		String file1_rename = multi.getFilesystemName(file1);
		if(file1_rename == null) { file1_rename = ""; }

		b.setFile1(file1_rename);
		 String file1_thumb = "";
		// 썸네일 파일명 미구현
		  if (!file1_rename.equals("")) { // 첨부파일1 있다면
		      String oPath = uploadPath + "/" + file1_rename; // 첨부파일1 원본 경로
		      File oFile = new File(oPath);
		      int index = oPath.lastIndexOf(".");
		      String ext = oPath.substring(index + 1); // 파일 확장자
		      file1_thumb = "thumb_" + oFile.getName(); // 썸네일 파일명
		      String tPath = oFile.getParent() + File.separator + file1_thumb; // 썸네일 저장 경로 및 파일명
		      File tFile = new File(tPath);
		      double ratio = 2; // 이미지 축소 비율(용량 줄이기)
		      try {
		          BufferedImage oImage = ImageIO.read(oFile); // 원본 이미지
		          int tWidth = (int) (oImage.getWidth() / ratio); // 생성할 썸네일 이미지의 너비
		          int tHeight = (int) (oImage.getHeight() / ratio); // 생성할 썸네일 이미지의 높이

		          BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일 이미지
		          Graphics2D graphic = tImage.createGraphics();
		          Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
		          graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
		          graphic.dispose(); // 리소스를 모두 해제
		          ImageIO.write(tImage, ext, tFile); // 썸네일 저장
		      } catch (IOException e) {
		          e.printStackTrace();
		      }
		  }

		b.setFile1_s(file1_thumb); //썸네일 명 
		
	    System.out.println(b.toString());
		// BbsDAO를 사용하여 데이터베이스 작업 수행
		BbsDAO dao = new BbsDAO();

		try {
		  
		    dao.insertBbs(b);
		} catch (Exception e) {
		 
		    e.printStackTrace();
		  
		}
		System.out.println("doPost() 호출됨2");
		// 데이터베이스 작업이 성공적으로 완료되었으면 리스트 페이지로 리다이렉트
		response.sendRedirect("list");

	}

}
