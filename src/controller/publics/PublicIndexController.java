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
import model.Song;
import utils.DefineUtil;

public class PublicIndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PublicIndexController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		//lấy số cat
				SongDAO songDAO = new  SongDAO();
				int numberOfItem = songDAO.numberOfItemSong();
				int numberOfPage = (int)Math.ceil((float)numberOfItem/DefineUtil.NUMBER_PER_PAGE); // get số trang
				int currentPage = 1;
				try {
					currentPage = Integer.parseInt(request.getParameter("page"));
				} catch (NumberFormatException e) {
				}
				int offset = (currentPage - 1)*DefineUtil.NUMBER_PER_PAGE; 
				//nếu page ng dùng truyền vào lớn hơn hoặc nhỏ hơn numberOfPage
						if(currentPage > numberOfPage || currentPage < 1 ) {
							currentPage = 1;	
						}
						
			String search="";
			if(request.getParameter("search") != null) {
							//ng dùng có nhập tìm kiếm
				search = request.getParameter("search");
			}
		Song songSearch = new Song(search);
		List<Song> listSearch = songDAO.findAllByNameOderByNewName(songSearch);
		List<Song> songs = songDAO.getAllPagina(offset);
		if(!"".equals(search)) {
			songs = listSearch;
		}
		
		request.setAttribute("numberOfItem", numberOfItem);
		request.setAttribute("numberOfPage", numberOfPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("search", search);
		request.setAttribute("songs", songs);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/index.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
