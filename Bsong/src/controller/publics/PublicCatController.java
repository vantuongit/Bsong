package controller.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.UrlConstants;
import daos.CategoryDAO;
import daos.SongDAO;
import model.Category;
import model.Song;
import utils.DefineUtil;

public class PublicCatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
	private SongDAO songDAO;
       
    public PublicCatController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		int id = 0;
		int currentPage = 1;
		try {
			 id = Integer.parseInt(request.getParameter("id"));
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		
		try {
			currentPage = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			currentPage=1;
		}
		categoryDAO = new CategoryDAO();
		songDAO = new SongDAO();
		Category category = categoryDAO.getById(id);
		if(category == null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		int numberOfItem = songDAO.numberOfItem(id); //số bài
		int numberOfPage = (int)Math.ceil((float)numberOfItem/DefineUtil.NUMBER_PER_PAGE); //số trang
		
		if(currentPage >numberOfPage || currentPage < 1) {
			currentPage =1;
		}
		int offset = (currentPage-1) * DefineUtil.NUMBER_PER_PAGE;
		
		List<Song> songs = songDAO.getAllByCategoryPagination(offset,id);
		
		request.setAttribute("numberOfItem", numberOfItem);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("category", category);
		request.setAttribute("songs", songs);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/cat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
