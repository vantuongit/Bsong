<%@page import="utils.StringUtil"%>
<%@page import="model.Song"%>
<%@page import="daos.SongDAO"%>
<%@page import="java.util.List"%>
<%@page import="daos.CategoryDAO"%>
<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="searchform">
  <form id="formsearch" name="formsearch" method="get" action="<%=request.getContextPath()%>/home">
    <span>
    <input name="search"  placeholder="Nhập tên bài hát" class="editbox_search" id="editbox_search" maxlength="80" value = "<%if(request.getParameter("search")!=null) out.print(request.getParameter("search")); %>"  type="text" />
    </span>
    <input name="button_search" value= "" src="<%=request.getContextPath() %>/resources/public/images/search.jpg" class="button_search" type="image" />
  </form>
</div>
<div class="clr"></div>
<div class="gadget">
  <h2 class="star">Danh mục bài hát</h2>
  <div class="clr"></div>
  <ul class="sb_menu">
  <%
		CategoryDAO categoryDAO = new CategoryDAO();
  		List<Category> categories = categoryDAO.getCategories();
  		if(categories.size()>0){
  		for(Category category:categories ){
  			
  			/*
  			/cat?id=2
  			bsong.local:8080/danh-muc/nhac-tre-1.html
  		*/
  			 String urlSlug = request.getContextPath() + "/category/" + StringUtil.makeSlug(category.getName())+"-" + category.getId()+".html";
  		
	%>
    <li><a href="<%=urlSlug%>"><%=category.getName() %></a></li>
    <%}} %>
  </ul>
</div>

<div class="gadget">
  <h2 class="star"><span>Bài hát mới</span></h2>
  <div class="clr"></div>
    <%
		SongDAO songDAO = new SongDAO();
  		List<Song> songss = songDAO.getAll(4);
  		if(songss.size()>0){
  		for(Song song:songss ){
  			String urlSlug=request.getContextPath() +"/detail/"+StringUtil.makeSlug(song.getName())+ "-"+song.getId() + ".html";
	%>
 
  <ul class="ex_menu">
    <li><a href="<%=urlSlug%>"><%=song.getName() %></a><br />
      <%if(song.getPreview_text().length()>30) out.print(song.getPreview_text().substring(0, 30)); else out.print(song.getPreview_text()); %>
     </li>
  </ul>
     <%}} %>
</div>