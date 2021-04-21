<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
   <%
    	Song songdetail = (Song) request.getAttribute("song");
   		if(songdetail != null){
   			
   		
    %>
    <div class="article">
      <h1><%=songdetail.getName() %></h1>
      <div class="clr"></div>
      <p>Ngày đăng: <%=songdetail.getDate_create() %>. Lượt xem: <%=songdetail.getCounter() %></p>
      <div class="vnecontent">
          <%=songdetail.getDetail_text() %>
      </div>
    </div>
    <%} %>
    <div class="article">
      <h2>Bài viết liên quan</h2>
      <%
      	List<Song> relatedSong = (List<Song>) request.getAttribute("relatedSong");
      	if(relatedSong != null && relatedSong.size() > 0){
      		for(Song relatedSongs : relatedSong){
      			
      			String urlSlug1 = request.getContextPath() + "/detail/" + StringUtil.makeSlug(relatedSongs.getName())+"-" + relatedSongs.getId()+".html";
      %>
      <div class="comment"> <a href="<%=urlSlug1%>"><img src="<%=request.getContextPath() %>/uploads/<%=relatedSongs.getPicture() %>" width="40" height="40" alt="" class="userpic" /></a>
        <h2><a href="<%=urlSlug1%>"><%=relatedSongs.getName() %></a></h2>
        <p><%=relatedSongs.getPreview_text() %></p>
      </div>
      <div class="clr"></div>
      
    </div>
      <%}} %>
    <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  </div>
 
  
 
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
