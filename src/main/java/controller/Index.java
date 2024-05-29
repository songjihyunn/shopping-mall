package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ItemDAO;
import dao.MemberDAO;
import dto.Category;
import dto.Item;
import dto.Member;

@WebServlet("") //주소값 처리
public class Index extends HttpServlet {	//HttpServlet 상속
	private static final long serialVersionUID = 1L;	//long 타입

    public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageSize = 10;
		
		//현재 보여지는 페이지의 넘버 값 처리
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		//전체 게시글 갯수 초기화
		int count = 0;

		//페이지 내에서 보여질 넘버링 숫자 처리 초기화
		int number = 0;

		ItemDAO dao = new ItemDAO();
		MemberDAO dao1 = new MemberDAO();

		//검색어
		String field = request.getParameter("field");
		String search = request.getParameter("search");

		//전체 게시글 수
		count = dao.getAllcount(field, search);

		//현재 보여질 페이지 limit 값 설정
		int startRow = (pageNum - 1) * pageSize;
		int endRow = pageSize;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("id:" + id);
		
		ArrayList<Item> v = dao.getAllMember(startRow, endRow, field, search);
		ArrayList<Item> v1 = dao.getPopularMember(startRow, endRow, field, search);
		ArrayList<Item> v2 = dao.gethatItems(startRow, endRow, field, search);
		ArrayList<Item> v3 = dao.getTimeMember(startRow, endRow, field, search);
		ArrayList<Item> v4 = dao.getAccItems(startRow, endRow, field, search);
		Member v5 = dao1.oneMember(id);

		//넘버링 숫자
		number = count - (pageNum - 1) * pageSize;

		request.setAttribute("v", v);
		request.setAttribute("v1", v1);
		request.setAttribute("v2", v2);
		request.setAttribute("v3", v3);
		request.setAttribute("v4", v4);
		request.setAttribute("v5", v5);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);

		request.setAttribute("field", field);
		request.setAttribute("search", search);

		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);
	}

}









