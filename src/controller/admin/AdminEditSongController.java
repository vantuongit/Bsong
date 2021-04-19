package controller.admin;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import constants.GlobalConstant;
import daos.CategoryDAO;
import daos.SongDAO;
import daos.UserDAO;
import model.Category;
import model.Song;
import model.Users;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminEditSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminEditSongController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//CHECK LOGIN
		if(!AuthUtil.checkLogin(request,response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		SongDAO songDAO = new SongDAO();
		CategoryDAO  categoryDAO= new CategoryDAO();
		List<Category> categories = categoryDAO.getCategories();
		request.setAttribute("categories", categories);
		
		StringBuilder sbd = new StringBuilder();
		String url = "";
		int id=0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin/song/index?err=1");
			return;
		}
	
		Song songs = songDAO.getById(id);
		if(songs != null) {
			request.setAttribute("songs", songs);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/edit.jsp");
			rd.forward(request, response);
		return;
	
		}
		response.sendRedirect(request.getContextPath()+"/admin/song/index?msg="+GlobalConstant.ERROR);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//CHECK LOGIN
		if(!AuthUtil.checkLogin(request,response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		
		
		SongDAO songDAO = new SongDAO();
		int id=0;
		try {
			 id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/admin/song/index?msg="+GlobalConstant.ERROR);
			return;
		}
	
		String name = request.getParameter("name");
		int cat_id = Integer.parseInt(request.getParameter("category"));
		String preview_text = request.getParameter("preview");
		String detail_text = request.getParameter("detail");
		
		Part filePart = request.getPart("picture");
		//get dữ liệu cũ
		Song song = songDAO.getById(id);
		
		//tao thư mục lưu ảnh
		String rootPath = request.getServletContext().getRealPath("");
		String DirUploadPath = rootPath + "uploads";
		File dirFile = new File(DirUploadPath);
		if(!dirFile.exists()) {
			dirFile.mkdirs();
		}
		
		//String picture = filePart.getSubmittedFileName();
		String fileName = FileUtil.getName(filePart);
		String picture = "";
		if(fileName.isEmpty()) {
			picture = song.getPicture();
		}else {
			picture = FileUtil.rename(fileName);
		}
		//đường dẫn file
		String filePathName = DirUploadPath + File.separator + picture;
		
		System.out.println(filePart);
		Song songs = new Song(id, name, preview_text, detail_text, picture, new Category(cat_id));
		int countRecordUpdated = songDAO.update(songs);
		
		StringBuilder sbd = new StringBuilder();
		String url = "";
		if(countRecordUpdated > 0) {
			if(!fileName.isEmpty()) {
				//xóa file cũ
				String oldFilePathName = DirUploadPath + File.separator + song.getPicture();
				File oldFile = new File(oldFilePathName);
				if(oldFile.exists()) { // ktra oldFile có tồn tại k
					oldFile.delete();
				}
				//ghi lại file mới
				filePart.write(filePathName);
			}
			url = sbd.append(request.getContextPath())
					.append("/admin/song/index?msg=")
					.append(GlobalConstant.SUCCESS).toString();
			response.sendRedirect(url);
			return;
		}else {
			//fail
			CategoryDAO  categoryDAO= new CategoryDAO();
			List<Category> categories = categoryDAO.getCategories();
			request.setAttribute("categories", categories);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/edit.jsp?msg="+GlobalConstant.ERROR);
			rd.forward(request, response);
		}
	}
}


