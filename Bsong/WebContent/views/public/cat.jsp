<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
    <%
    	Category categoriess = (Category) request.getAttribute("category");
  		  if(categoriess != null){
    %>
		<h1><%=categoriess.getName() %></h1>
		<%} %>
    </div>
      <%
    	List<Song> songs = (List<Song>) request.getAttribute("songs");
    	if(songs != null && songs.size() > 0){
    		for(Song song: songs){
    %>
    <div class="article">
      <h2><a href="<%=request.getContextPath() %>/detail?id=<%=song.getId() %>" title="<%=song.getName()%>"><%=song.getName()%></a></h2>
      <p class="infopost">Ngày đăng: <%=song.getDate_create() %>. Lượt xem: <%=song.getCounter() %> <a href="#" class="com"><span>1</span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath() %>/uploads/<%=song.getPicture() %>" width="177" height="213" alt="Đổi thay" class="fl" /></div>
      <div class="post_content">
        <p><%=song.getPreview_text() %></p>
        <p class="spec"><a href="<%=request.getContextPath() %>/detail?id=<%=song.getId() %>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      <div class="clr"></div>
    </div>
    <%}}else{ %>
     <div class="article">
     <h2>Chưa có bài hát!</h2>
    <%} %>
    
    <%
    	int numberOfItem = (int) request.getAttribute("numberOfItem");
   		int currentPage = (int) request.getAttribute("currentPage");
  		int numberOfPage = (int) request.getAttribute("numberOfPage");
  		if(songs != null && songs.size()>0){
    %>
    <p class="pages"><small>Trang <%=currentPage %> của <%=numberOfPage %></small>
    <%for(int i = 1; i<numberOfPage; i++){   
    %>
    <%
    	if(currentPage == i){
    		
    %>
    <span><%=i %></span>
    
    <%
        	}else{ 
            String urlSlug = request.getContextPath() + "/category/" + StringUtil.makeSlug(categoriess.getName())+"-"+(categoriess.getId()) +"."+i + ".html";
            String urlSlugNext = request.getContextPath() + "/category/" + StringUtil.makeSlug(categoriess.getName())+"-"+(categoriess.getId()) +"."+(currentPage+1) + ".html";
        %>
    <a href="<%=urlSlug%>"><%=i %></a>
    <%}}} %>
    <a href="<%=request.getContextPath() + "/category/" + StringUtil.makeSlug(categoriess.getName())+"-"+(categoriess.getId()) +"."+(currentPage+1) + ".html"%>">&raquo;</a></p>
   
  </div>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>