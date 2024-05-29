package admin.item;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ItemDAO;
import dto.Category;

@WebServlet("/admin/item/category_ok")
public class ItemWriteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ItemWriteCategory() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ca_id = request.getParameter("ca_id");
		String ca_id2 = request.getParameter("ca_id2");


		ItemDAO dao = new ItemDAO();
		
		ArrayList<Category> v = dao.getCategory2(ca_id); //카테고리(대분류)를 이용해 중분류 추출
		
		request.setAttribute("v", v);
		request.setAttribute("ca_id2", ca_id2);


		RequestDispatcher dis = request.getRequestDispatcher("cate2.jsp");
		dis.forward(request, response);
	}

}
