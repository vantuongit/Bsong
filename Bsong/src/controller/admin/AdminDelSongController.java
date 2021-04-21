package controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.GlobalConstant;
import daos.SongDAO;
import daos.UserDAO;
import model.Song;
import utils.AuthUtil;

public class AdminDelSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminDelSongController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//CHECK LOGIN
		if(!AuthUtil.checkLogin(request,response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
			//response.sendRedirect(request.getContextPath()+"/auth/login");
			RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath()+"/auth/login");
			rd.forward(request, response);
			return;
		}
		/*
		 * RequestDispatcher rd =
		 * request.getRequestDispatcher("/views/admin/index.jsp"); rd.forward(request,
		 * response);
		 */
		
		int id = Integer.parseInt(request.getParameter("id"));
		SongDAO songDAO = new SongDAO();
		Song song = songDAO.getById(id);
		if(song == null) {
			response.sendRedirect(request.getContextPath()+"/admin/song/index?msg=error");
			return;
		}
		if(songDAO.del(id) > 0) {
			//thành công xóa
			final String dirPathName = request.getServletContext().getRealPath("/uploads");
			String picture = song.getPicture();
			if(!picture.isEmpty()) {
			String filePathName = dirPathName + File.separator + picture;
			File file = new File(filePathName);
			if(file.exists()) {
				file.delete();
			}}
			response.sendRedirect(request.getContextPath()+"/admin/song/index?msg=success");
			return;
		}else {
			//thất bại
			response.sendRedirect(request.getContextPath()+"/admin/song/index?msg=success");
			return;
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
}
