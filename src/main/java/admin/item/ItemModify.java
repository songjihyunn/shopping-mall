package admin.item;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ItemDAO;
import dto.Category;
import dto.Item;


@WebServlet("/admin/item/ItemModify")
public class ItemModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ItemModify() {
        super();
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int it_uid = Integer.parseInt(request.getParameter("it_uid"));
		ItemDAO dao = new ItemDAO();
		Item i = dao.oneItem(it_uid);
		request.setAttribute("item", i);
		ArrayList<Category> v = dao.getTotal(); //카테고리 값
		request.setAttribute("v", v);
		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");


		//오늘 날짜

		java.util.Date today = new java.util.Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);

		//저장 경로 (사용자 item 폴더에 저장 처리)

		String uploadPath="D:\\jsp_academy\\teampro\\src\\main\\webapp\\upload_item";
		int size=10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		String pageNum = "";
		if(multi.getParameter("pageNum") != null) {
			pageNum = multi.getParameter("pageNum");
		}
		String field = "";
		if(multi.getParameter("field") != null) {
			field = multi.getParameter("field");
		}
		String search = "";
		if(multi.getParameter("search") != null) {
			search = URLEncoder.encode(multi.getParameter("search"),"utf-8"); //한글 전달
		}
		Item item = new Item();
		item.setIt_uid(Integer.parseInt(multi.getParameter("it_uid")));
		item.setCategory1(multi.getParameter("category1"));
		item.setCategory2(multi.getParameter("category2"));
		item.setMb_id(multi.getParameter("mb_id"));
		item.setIt_name(multi.getParameter("it_name"));
		item.setIt_sale(Integer.parseInt(multi.getParameter("it_sale")));
		item.setIt_price(Integer.parseInt(multi.getParameter("it_price")));
		item.setIt_point(Integer.parseInt(multi.getParameter("it_point")));
		item.setIt_qty(Integer.parseInt(multi.getParameter("it_qty")));
		item.setIt_option(multi.getParameter("it_option"));
		item.setIt_use(multi.getParameter("it_use"));
		item.setIt_date(signdate);
		item.setIt_size("it_size");

		String it_type1 = "Y";
		String it_type2 = "Y";
		String it_type3 = "Y";
		String it_type4 = "Y";
		String it_type5 = "Y";
		if(multi.getParameter("it_type1") == null) {
			it_type1 = "N";
		}
		if(multi.getParameter("it_type2") == null) {
			it_type2 = "N";
		}
		if(multi.getParameter("it_type3") == null) {
			it_type3 = "N";
		}
		if(multi.getParameter("it_type4") == null) {
			it_type4 = "N";
		}
		if(multi.getParameter("it_type5") == null) {
			it_type5 = "N";
		}
		item.setIt_type1(it_type1);
		item.setIt_type2(it_type2);
		item.setIt_type3(it_type3);
		item.setIt_type4(it_type4);
		item.setIt_type5(it_type5);

		Enumeration files=multi.getFileNames();

		String file1 = (String)files.nextElement();
		String file1_rename = multi.getFilesystemName(file1);
		if(file1_rename == null) { file1_rename = ""; }
		
		String file2 = (String)files.nextElement();
		String file2_rename = multi.getFilesystemName(file2);
		if(file2_rename == null) { file2_rename = ""; }
		
		String file3 = (String)files.nextElement();
		String file3_rename = multi.getFilesystemName(file3);
		if(file3_rename == null) { file3_rename = ""; }
		
		String file4 = (String)files.nextElement();
		String file4_rename = multi.getFilesystemName(file4);
		if(file4_rename == null) { file4_rename = ""; }
		
		String file5 = (String)files.nextElement();
		String file5_rename = multi.getFilesystemName(file5);
		if(file5_rename == null) { file5_rename = ""; }

		item.setFile1(file1_rename);
		item.setFile2(file2_rename);
		item.setFile3(file3_rename);
		item.setFile4(file4_rename);
		item.setFile5(file5_rename);

		//// 썸네일 ////

		String file1_thumb = ""; //썸네일 파일명
		if(!file1_rename.equals("")){ //첨부가 있다면
			String oPath = uploadPath+"/"+file1_rename; // 원본 경로
			File oFile = new File(oPath);
			int index = oPath.lastIndexOf(".");
			String ext = oPath.substring(index + 1); // 파일 확장자
			file1_thumb = "thumb_" + oFile.getName(); //썸네일 파일명
			String tPath = oFile.getParent() + File.separator + file1_thumb; // 썸네일 저장 경로 및 파일명
			File tFile = new File(tPath);
			double ratio = 2; // 이미지 축소 비율

			try {
				BufferedImage oImage = ImageIO.read(oFile); // 원본이미지
				int tWidth = (int) (oImage.getWidth() / ratio); // 생성할 썸네일이미지의 너비
				int tHeight = (int) (oImage.getHeight() / ratio); // 생성할 썸네일이미지의 높이
				BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일이미지
				Graphics2D graphic = tImage.createGraphics();
				Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
				graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
				graphic.dispose(); // 리소스를 모두 해제
				ImageIO.write(tImage, ext, tFile); //썸네일 저장
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		item.setFile1_thumb(file1_thumb); //썸네일 명
		ItemDAO dao = new ItemDAO();
		dao.updateitem(item); 
		/*
		 * response.sendRedirect("modify?it_uid="+item.getIt_uid()+"&pageNum="+pageNum+
		 * "&field="+field+"&search="+search);
		 */
		response.sendRedirect("list");

	}

}
