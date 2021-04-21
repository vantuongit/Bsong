<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/admin/inc/header.jsp" %>
<%@ include file="/templates/admin/inc/leftbar.jsp" %>
<%@page import="model.Song"%>
<div id="page-wrapper">
    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <h2>Sửa bài hát</h2>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">
            <div class="col-md-12">
                <!-- Form Elements -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
<%
		Song songs = (Song)request.getAttribute("songs");
		if(songs != null){
			
		
   		int id = songs.getId();
		String name = songs.getName();
		String preview_text = songs.getPreview_text();
		String detail_text = songs.getDetail_text();
		String picture = songs.getPicture();
		String cat_id = String.valueOf(songs.getCategory().getId()) ;
		String nameCat = songs.getCategory().getName();
		

	
%>    
                            <form role="form" method="post" enctype="multipart/form-data" id="form">
                                    <div class="form-group">
                                        <label for="name"></label>
                                        <input type="text" id="name"  value="<%=name %>" name="name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="category">Danh mục bài hát</label>
                                        <select id="category" name="category" class="form-control">
                                         
                                       <%
                                        	if(request.getAttribute("categories")!=null){
                                        	List<Category> categories = (List<Category>) request.getAttribute("categories");
                                        	if(categories.size()>0){
                                        		
                                        		for(Category category :categories){
                                        			int catId=category.getId();
                                        			String catName=category.getName();
                                        	
                                        %>
	                                        <option value="<%=catId%>"><%=catName %></option>
	                                        <%}}} %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="picture">Hình ảnh</label>
                                        <input type="file" name="picture" value=""/>
                                        <%
                                        	if(!picture.isEmpty()){
                                        %>
                                        <br/>
                                        <img with="200px" height="200px" src="<%=request.getContextPath()%>/uploads/<%=picture %>" alt="ảnh" />
                                        <%} %>
                                    </div>
                                    <div class="form-group">
                                        <label for="preview"></label>
                                        <textarea id="preview" class="form-control" rows="3" name="preview"><%=preview_text %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="detail"></label>
                                        <textarea id="detail" class="form-control" id="detail" rows="5" name="detail"><%=detail_text %></textarea>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-success btn-md">Sửa</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>
                <!-- End Form Elements -->
            </div>
        </div>
        <!-- /. ROW  -->
    </div>
    <!-- /. PAGE INNER  -->
</div>
<script>
    document.getElementById("song").classList.add('active-menu');
</script>
<!-- /. PAGE WRAPPER  -->
<%@ include file="/templates/admin/inc/footer.jsp" %>