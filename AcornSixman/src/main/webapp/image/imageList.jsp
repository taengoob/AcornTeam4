<%@page import="com.dto.ImageDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<ImageDTO> images = (List<ImageDTO>)request.getAttribute("Images");
	%>
	
	<%
	if (images != null && images.size() > 0) {
		for(ImageDTO image : images) { %>
			<img alt="no image" src="<%= image.getImage_url() %>"> <br>
	<%	
		}
	}
	%>
	
	<a href="ImageUploadFormServlet">등록</a>
</body>
</html>