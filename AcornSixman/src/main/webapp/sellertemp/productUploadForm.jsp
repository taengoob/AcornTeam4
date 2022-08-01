<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록</title>
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
			<input type="submit" value="제품등록">
		    <a href="UploadedListServlet">취소</a>
		</div>
	</form>
</body>
</html>