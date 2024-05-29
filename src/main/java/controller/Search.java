package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ItemDAO;
import dto.Item;

@WebServlet("/search")
public class Search extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String field = "it_name"; // 검색할 필드를 지정 (필요에 따라 변경 가능)
        int pageSize = 10;

        // 현재 보여지는 페이지의 넘버 값 처리
        int pageNum = 1;
        if(request.getParameter("pageNum") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        // 전체 게시글 갯수 초기화
        int count = 0;

        // 페이지 내에서 보여질 넘버링 숫자 처리 초기화
        int number = 0;

        ItemDAO dao = new ItemDAO();

        // 전체 게시글 수
        count = dao.getAllcount(field, search);

        // 현재 보여질 페이지 limit 값 설정
        int startRow = (pageNum - 1) * pageSize;
        int endRow = pageSize;

        // 검색어가 있을 경우 검색 결과를 가져옴
        ArrayList<Item> searchResults = new ArrayList<>();
        if (search != null && !search.isEmpty()) {
            searchResults = dao.getAllMember(startRow, endRow, field, search);
        } else {
            searchResults = dao.getAllMember(startRow, endRow, field, ""); // 검색어가 없을 때 전체 목록 가져오기
        }

        // 넘버링 숫자
        number = count - (pageNum - 1) * pageSize;

        // 검색 결과를 JSP로 전달
        request.setAttribute("searchResults", searchResults);
        request.setAttribute("number", number);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("count", count);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("field", field);
        request.setAttribute("search", search);

        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }
}
