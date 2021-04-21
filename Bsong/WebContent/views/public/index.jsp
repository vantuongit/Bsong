<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<%@page import="java.util.List" %>
<%@page import="model.Song" %>
<div class="content_resize">
  <div class="mainbar">
   <%
					List<Song> songs =(List<Song>)request.getAttribute("songs");
   					String searchs = (String) request.getAttribute("search")+"";
   					// search 've'
   					String text =  "";
   					
   					
   					if(songs.size()>0 && songs != null){
   						int i=0;
						for(Song song: songs){
							i++;
							int id = song.getId();
							if(searchs != null){
		   						text = "<span style='color: black;'>"+searchs+"</span>";
		   					}
							String songName = song.getName();
							songName = songName.replaceAll(searchs, text);
						
							int counter = song.getCounter();
							String picture = song.getPicture();
							String catName = song.getCategory().getName();
							String detail = song.getDetail_text();
							String preview= song.getPreview_text();
							int count = song.getCounter();
							Timestamp date_create = song.getDate_create();
							String urlSlug = request.getContextPath() + "/detail/" + StringUtil.makeSlug(song.getName())+"-" + song.getId()+".html";
           
 %>
    <div class="article">
      <h2><a href="<%=urlSlug %>" title="<%=songName %>"><%=songName %></a></h2>
      <p class="infopost">Ngày đăng:<%=date_create %> Lượt xem: <%=count %> <a href=" <%=urlSlug %>" class="com"><span><%=i %></span></a></p>
      <div class="clr"></div>
      <div class="img"><img src="<%=request.getContextPath()%>/uploads/<%=picture %>" width="177" height="213" alt="" class="fl" /></div>
      <div class="post_content">
        <p><%=preview %></p>
        <p class="spec"><a href="<%=urlSlug%>" class="rm">Chi tiết &raquo;</a></p>
      </div>
      
      <div class="clr"></div>
    </div>
<%}}else{ %>
<div class="article">
<h3>Không có bài hát nào!!!</h3>
</div>
<%}%>
   <%
   int numberOfItems =(Integer) request.getAttribute("numberOfItems");
	int numberOfPage =(Integer) request.getAttribute("numberOfPage");
		int currentPage =(Integer) request.getAttribute("currentPage");
			 if(songs != null && songs.size() > 0){
   %>
    <p class="pages"><small>Trang <%=currentPage %> của <%=numberOfPage %></small>
    <%
    	for(int i=1; i<=numberOfPage; i++){
    %>
   	<%
   		if(currentPage == i){
   	%>
    <span><%=i %></span>
  <%}else{ %>
    <a href="<%=request.getContextPath()%>/home?page=<%=i%>"><%=i %></a>
    <%}} %>
    <a href="<%=request.getContextPath()%>/home?page=<%=currentPage+1%>">&raquo;</a></p>
    
  </div>
 <%} %>
  <div class="sidebar">
      <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
