package controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import constants.GlobalConstant;
import daos.CategoryDAO;
import daos.SongDAO;
import model.Category;
import model.Song;
import utils.AuthUtil;
import utils.FileUtil;

@MultipartConfig
public class AdminAddSongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminAddSongController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//CHECK LOGIN
		if(!AuthUtil.checkLogin(request,response)) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		CategoryDAO  categoryDAO= new CategoryDAO();
		List<Category> categories = categoryDAO.getCategories();
		request.setAttribute("categories", categories);
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/song/add.jsp");
		rd.forward(request, response);
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
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null) {
			response.sendRedirect(request.getContextPath()+ "/auth/login");
			return;
		}
		
		SongDAO songDAO = new SongDAO();
		StringBuilder sbd = new StringBuilder();
		int catId=Integer.parseInt(request.getParameter("category"));
		String name = request.getParameter("name");
		String description=request.getParameter("preview");
		String detail = request.getParameter("detail");
		// không biết, :(
		Part filePart = request.getPart("picture");
		String fileName =FileUtil.getName(filePart); 
		String picture =FileUtil.rename(fileName);
		if (!"".equals(fileName)) {
			String rootPath = request.getServletContext().getRealPath("");
			String DirUploadPath = rootPath + "uploads";
		
			File createDir = new File(DirUploadPath);
			if (!createDir.exists()) {
				createDir.mkdir(); 
			}
			StringBuilder sb = new StringBuilder();
			String filePath = sb.append(DirUploadPath).append(File.separator).append(picture).toString();
			filePart.write(filePath);
			//check trùng tên
			if(songDAO.hasSong(name)) {
				response.sendRedirect(request.getContextPath()+"/admin/song/index?err=1");
				return;
			}
			Song song =new Song(name, description, detail, picture, new Category(catId));
			
			int countRecordInserted = songDAO.add(song);
			String url = "";
			if(countRecordInserted > 0) {
				url = sbd.append(request.getContextPath())
						.append("/admin/song/index?msg=")
						.append(GlobalConstant.SUCCESS).toString();
				response.sendRedirect(url);
				return;
			}
			//fail
			response.sendRedirect(request.getContextPath()+"/admin/song/index?msg="+GlobalConstant.ERROR);
			
		}
		
	}

}
