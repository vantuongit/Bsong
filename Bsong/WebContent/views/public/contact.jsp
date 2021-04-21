<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<script	type="text/javascript" src="resources/public/js/jquery-3.5.1.min.js"></script>
<script	type="text/javascript" src="resources/public/js/jquery.validate.min.js"></script>	
<div class="content_resize">

  <div class="mainbar">
    <div class="article">
      <h2><span>Liên hệ</span></h2>
      <div class="clr"></div>
      <%
      	String msg = request.getParameter("msg");
      if("success".equals(msg)){
    	  out.print("<div style=\"background: yellow; color: red; font-weight: bold; padding: 5px \">gửi liên hệ thành công</div>");
      }
      if("error".equals(msg)){
    	  out.print("<div style=\"background: yellow; color: red; font-weight: bold; padding: 5px \">gửi liên hệ thất bại</div>");
      }
     	String name = request.getParameter("name");
		String email = request.getParameter("email");
		String website = request.getParameter("website");
		String message = request.getParameter("message");
      
      %>
      <p>Khi bạn có thắc mắc, vui lòng gửi liên hệ, chúng tôi sẽ phản hồi trong thời gian sớm nhất.</p>
    </div>
    <div class="article">
      <h2>Gửi liên hệ đến chúng tôi</h2>
      <div class="clr"></div>
      <form action="" method="post" id="sendemail" class="sendemail">
        <ol>
          <li>
            <label for="name">Họ tên (bắt buộc)</label>
            <input id="name" value="" name="name" class="text" />
          </li>
          <li>
            <label for="email">Email (bắt buộc)</label>
            <input id="email" value="" name="email" class="text" />
           
          </li>
          <li>
            <label for="website">Website</label>
            <input id="website" value="" name="website" class="text" />
          </li>
          <li>
            <label for="message">Nội dung</label>
            <textarea id="message" name="message" rows="8" cols="50"></textarea>
          </li>
          <li>
            <input type="image" name="imageField" id="imageField" src="<%=request.getContextPath() %>/resources/public/images/submit.gif" class="send" />
            <div class="clr"></div>
          </li>
        </ol>
      </form>
      
      <script type="text/javascript" class="vali" >
	$(document).ready(function () {
		$('#sendemail').validate({
			rules: {
				"name": {
					required: true,
					minlength : 8,
					maxlength : 32,
				},
				"email": {
					required: true,
					email: "true",
				},
				"website": {
					required: true,
				},
				"message": {
					required: true,
				},
			},
			messages: {
			  "name": {
				required : "Vui lòng nhập Tên",
				minlength : "Nhập tối thiểu 8 kí tự",
				maxlength : "nhập tối đa 32 kí tự",
			  },
			  "email": {
				required: "vui lòng nhập email",
				email: "Vui lòng nhập đúng định dạng",
			  },
			  "website": {
				required: "Vui lòng nhập website",
			  },
			  "message": {
					required: "Vui lòng nhập mô tả",
				  },
			},
		});
	});	
</script>
      
    </div>
  </div>
  <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
