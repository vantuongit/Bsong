 package controller.publics;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.SongDAO;
import model.Song;

public class PublicDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SongDAO songDAO;
       
    public PublicDetailController() {
        super();
        songDAO = new SongDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=0;
		try {
			id=Integer.parseInt( request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		Song song = songDAO.getSongDetail(id);
		if(song ==null) {
			response.sendRedirect(request.getContextPath() + "/404");
			return;
		}
		HttpSession session = request.getSession();
		String hasVisited = (String) session.getAttribute("hasVisited: " + id);
		if(hasVisited == null) {
			session.setAttribute("hasVisited: " + id, "yes");
			session.setMaxInactiveInterval(3600); // thời gian reset session
			songDAO.counterView(id);

		}
		
		List<Song> relatedSong = songDAO.getRelatedSong(song, 2); // hiển thị 2 tin liên quan
		request.setAttribute("song", song);
		request.setAttribute("relatedSong", relatedSong);
		RequestDispatcher rd = request.getRequestDispatcher("/views/public/detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
