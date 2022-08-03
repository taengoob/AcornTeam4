<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("Guitar"); %>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
    
<style type="text/css">
	#searchform{
		text-align: center;
		margin-top: 0px;
	}
	#search{
		width: 400px;
		height: 20px;
		margin-bottom: 3px;
		margin-top: 0px;
		padding-top: 0px;
		
	}
	#searchbox1{
		width: 1100px;
		height: 40px;
		margin: auto;
	}
	#searchbox2{
		width: 1100px;
		height: 40px;
		margin: auto;
		margin-top: 20px;
	}
	#searchbutton{
	background-size:20px;
	background-color: white;
	border:0px;
	margin-top:0px;
	padding-top: 0px;
	padding-bottom: 0px;
	}
	
	#searchimg{
	width: 20px;
	height: 20px;
	cursor:pointer;
	}
</style>
<div id="searchbox1">
<div id="searchbox2">
<form action="ProductListServlet" id="searchform">
	카테고리
	<select name="category">
	<%for (int i = 0; i < list.size(); i++) {
		CategoryDTO dto = list.get(i);%>
		<option <%if(dto.getCategoryId()=="all"){%> selected="selected"<%}%>><%=dto.getCategoryId() %></option>
		<%} %>
	</select>
		검색 <input type="text" name="searchStr" placeholder="기타를 검색해보세요!" id="search">
		<button id="searchbutton" hidden=""></button>
		<img alt="" src="image/search.png" id="searchimg">
</form>
</div>
</div>
