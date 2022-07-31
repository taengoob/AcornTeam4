<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("Guitar"); %>
<form action="ProductListServlet">
	<img alt="" src="image/category.png" width="20px" height="20px"></img>
	<select name="category">
	<%for (int i = 0; i < list.size(); i++) {
		CategoryDTO dto = list.get(i);%>
		<option <%if(dto.getCategoryId()=="all"){%> selected="selected"<%}%>><%=dto.getCategoryId() %></option>
		<%} %>
	</select>
		검색<input type="text" name="searchStr">
			<a href="#button"><button><img src="image/search.png"
			alt="검색" width="20px" height="20px"></button></a>
</form>