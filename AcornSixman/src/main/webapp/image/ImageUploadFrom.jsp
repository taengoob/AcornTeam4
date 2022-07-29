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
	<!--암호화 라이브러리 -->
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
	<script type="text/javascript">
	
		window.onload = function() {
			//테스트 버튼
			document.getElementById("testButton").onclick = onTestButtonCliked;
			
			//서브밋 예제
			//document.getElementById("imageForm").onsubmit = onTestButtonCliked;
		}
	
		//회원가입시 패스워드 암호화 해서 서버에 넘기는 예제
		//db에는 암호화 된 패스워드를 insert
		function onTestButtonCliked() {
			//입력값
			const target = document.getElementById("targetText");
			console.log("target.value :", target.value);
			
			//암호화 시킨값
			const encryptedVal = sha256(target.value);
			console.log("encrypted");
			
			//input에 데이터 넣기
			target.value = encryptedVal;
			console.log("target.value :", target.value);
			console.log("encryptedVal :", encryptedVal);
			
			//action으로 submit
			//return ture;
			
			//submit 중지
			//return false;
		}

		//로그인시 패스워드 비교 예제
		//서블릿에서 비교하는게 아닌 db에 있는 비밀번호를 javascript로 비교해야함
		
		//dbData가 db에서 받아온 값이라고 하면
		const dbData = sha256("1234");
		
		function comparePassword(inputPass) {
			//inputData를 암호화 시킨 후 dbData와 비교 
			const isSame = dbData === sha256(inputPass);
			console.log(isSame);
			
			if (isSame) {
				//비밀번호 일치 로그인
			}
			else {
				//비밀번호 불일치
			}
		}
	</script>

	<%
		List<CategoryDTO> categories = (List<CategoryDTO>)request.getAttribute("categories");
	%>

	<form action="ImageUploadServlet" method="post" enctype="multipart/form-data" id="imageForm">
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
				<td colspan="3"><input type="file" name="previewImage" id="preViewImage"></td>
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
			<tr>
				<th>판매자</th>
				<td colspan="3"><input type="text" name="productSeller" value="" id="productSeller"></td>
			</tr>
		</table>
		<div>
			<input type="submit" value="제품등록">
			<input type="hidden" value="암호화테스트" id="testButton" >
		    <a href="">취소</a>
		</div>
	</form>
</body>
</html>