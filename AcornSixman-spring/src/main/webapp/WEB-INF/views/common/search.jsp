<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.acorn.sixman.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <%List<CategoryDTO> list = (List<CategoryDTO>) request.getAttribute("Guitar"); %>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
	#searchform{
		margin: auto;
	}
	#search{
		margin: auto;
		width: 500px;
	}
	#searchimg{
		background-color: black;
		border: 0px;
	}

</style>
<div id="searchbox">
<form  action="/search" class="row g-2" id="searchform">
	<div class="col-3"></div>
  <div class="col-auto">
	<select class="form-select" aria-label="Default select example" name="category">
 	<%for (int i = 0; i < list.size(); i++) {
		CategoryDTO dto = list.get(i);%>
		<option <%if(dto.getCategoryId()=="all"){%> selected="selected"<%}%>><%=dto.getCategoryId() %></option>
		<%} %>
</select>
  </div>
  
  <div class="col-auto">
    <input type="text" class="form-control"  name="searchStr" id="search" placeholder="기타를 검색해보세요!">
  </div>
  <div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3" id="searchimg">검색</button>
  </div>
  <div class="col-3"></div>
</form>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>