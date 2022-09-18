<%@page import="com.dto.ProductDTO_Temp"%>
<%@page import="com.dto.ProductPageDTO"%>
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
#id {
	width: 50%;
}

.main-box {
	width: 100%;
	border: 1px solid;
	border-color: gray;
	overflow: hidden;
	width: 80%;
	margin-top: 3%;
	margin-left: 10%;
	text-align: left;
}

#id-con {
	background-color: #aaaaaa;
	padding: 6px;
	color: white;
}

.form-group {
	margin-top: 2.3%;
	margin-left: 7%;
}

#checkResult, #result #resultName {
	color: blue;
	font-size: 14px;
}

.addr-input {
	margin-left: 17.2%;
}

.finish {
	 text-align: right; 
	margin-right: 5%;
	margin-top: 3%;
	margin-bottom: 3%;
}

#type {
	height: 30px;
	display: flex;
	align-items: center;
	font-family: 'Lobster', cursive;
	font-size: 30px;
	padding: 0 2rem;
	font-weight: 600;
	justify-content: center;
	margin-top: 40px;
}
</style>
</head>
<body>
	 
	 
	 <h1 id="top">상품 수정</h1>
	<form action="ProductUploadServlet" class="form-inline" method="post" enctype="multipart/form-data" id="imageForm">
		<div class="main-box">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">제품명</label>
				<input type="text" class="form-control" id="id" name="productName"
					placeholder="" style="display: inline; width: 40%;">&nbsp;&nbsp; 
			</div>
 


			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">가격</label> 
					<input type="number" id="passwd1" name="productPrice"
					class="form-control" style="display: inline; width: 40%;">
				&nbsp;&nbsp;  
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">배송비</label>
				<input type="number" id="name" name="deliveryPrice" class="form-control"
					  style="display: inline; width: 40%;">
				&nbsp;&nbsp;  
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">재고</label>
				<input type="text" id="name" name="productStock" class="form-control"
					  style="display: inline; width: 40%;">
				&nbsp;&nbsp;  
			</div>
			<div class="finish">
				<button class="btn btn-outline-success" type="reset"
					  onclick="location.href='#top'" id="cancle">취소</button>
				<button class="btn btn-outline-success" type="submit"
					id="submit">수정</button>
			</div>
			<span class="addr-bottom-line"></span>
		</div>

	</form>
	
</body>
</html>