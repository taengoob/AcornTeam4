<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록</title>
<style type="text/css">
#imageForm{
margin-left : 30%; 
}
#submit{
margin-left: 486px;
}
#cancle {
	display:inline-block;
    border:1px solid black;
    width:7%;
    text-align:center;
    padding:15px;
    color:black;
    font-weight:bold;
    margin-top:3%;
    margin-right:0.5%;
    transition:.5s;
}
#cancle:hover{
    background-color: rgb(0, 150, 7);
    color:#fff;
}
#submit {
	display: inline-block;
    border: 1px solid black;
    width: 16%;
    text-align: center;
    padding: 15px;
    color: black;
    font-weight: bold;
    cursor: pointer;
    background-color: #fff;
    font-size: 16px;
    margin-left: 335px;
    transition: .5s;
}
#submit:hover{
    background-color: rgb(0, 150, 7);
    color:#fff;
}
</style>
</head>
<body>
	<%
		List<CategoryDTO> categories = (List<CategoryDTO>)request.getAttribute("categories");
	%>

	<form action="ProductUploadServlet" method="post" enctype="multipart/form-data" id="imageForm">
		<table border="1">
			<tr>
				<th>제품명</th>
				<td colspan="1"><input type="text" name="productName" value="" id="productName"></td>
				<th>카테고리</th>
				<td colspan="1">
					<select name="productCategory">
					<%
					for(CategoryDTO category : categories) {
						String categoryId = category.getCategoryId();
						String categoryName = category.getCategoryName();
					%>
						<option value="<%= categoryId %>"><%= categoryName %></option>
					<%
					}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td colspan="1"><input type="number" name="productPrice" value="0" id="productPrice"></td>
				<th>배송비</th>
				<td colspan="1"><input type="number" name="deliveryPrice" value="0" id="deliveryPrice"></td>
			</tr>
			<tr>
				<th>Model</th>
				<td colspan="1"><input type="text" name="productModel" value="" id="productModel"></td>
				<th>Maker</th>
				<td colspan="1"><input type="text" name="productMaker" value="" id="productMaker"></td>
			</tr>
			<tr>
				<th>Made in </th>
				<td colspan="1"><input type="text" name="productMadein" value="" id="productMadein"></td>
				<th>재고</th>
				<td colspan="1"><input type="number" name="productStock" value="0" id="productStock"></td>
			</tr>
			<tr>
				<th>미리보기 사진</th>
				<td colspan="3"><input type="file" name="previewImage" ></td>
			</tr>
			<tr>
				<th>제품사진</th>
				<td colspan="3"><input type="file" name="productImages" multiple="multiple"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea cols="80" rows="20" name="productContent"></textarea>
				</td>
			</tr>
		</table>
		<div>
		    <a href="UploadedListServlet" id="cancle">취소</a>
		    <input type="submit" id="submit" value="제품등록">
		</div>
	</form>
</body>
</html>