<%@page import="com.service.CommonService"%>
<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    CommonService service = new CommonService();
	List<CategoryDTO> categories = service.getGuitarCategoriesExceptAll();
	%>   
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("form").on("submit",function(event){	
		 var productId = $("#productId").val();
		 var productName = $("#productName").val();
		 var productPrice = $("#productPrice").val();
		 var productDelivery_price = $("#productDelivery_price").val();
		 var productModel = $("#productModel").val();
		 var productMaker = $("#productMaker").val();
		 var productMadein = $("#productMadein").val();
		 var productStock = $("#productStock").val();
		 var productSeller = $("#productSeller").val();
		 var productContent = $("#productContent").val();
		 if (productId.length==0) {
			 alert("productId 필수")
			 $("#productId").focus();
			 event.preventDefault();
		}else if(productName.length==0){
			alert("productName 필수")
			$("#productName").focus();
			event.preventDefault();
		}else if(productPrice.length==0){
			alert("productPrice 필수")
			$("#productPrice").focus();
			event.preventDefault();
		
		}else if(productDelivery_price.length==0){
			alert("productDelivery_price 필수")
			$("#productDelivery_price").focus();
			event.preventDefault();
		
		}else if(productModel.length==0){
			alert("productModel 필수")
			$("#productModel").focus();
			event.preventDefault();
		
		}else if(productMaker.length==0){
			alert("productMaker 필수")
			$("#productMaker").focus();
			event.preventDefault();
		
		}else if(productMadein.length==0){
			alert("productMadein 필수")
			$("#productMadein").focus();
			event.preventDefault();
		
		}else if(productStock.length==0){
			alert("productStock 필수")
			$("#productStock").focus();
			event.preventDefault();
		
		}else if(productSeller.length==0){
			alert("productSeller 필수")
			$("#productSeller").focus();
			event.preventDefault();
		
		}else if(productContent.length==0){
			alert("productContent 필수")
			$("#productContent").focus();
			event.preventDefault();
		};
		});
	
	
	});
</script>

 <div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록 </h1>
		</div>
	</div> 
	
	<div class="container">
	
		<form action="" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품아이디</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control" id="productId">
				</div>
			</div>
			
			
		
			<div class="form-group row" >
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3" >
					<input type="text" name="productName" class="form-control"id="productName">
					
				</div>
				<div>
				<select name="productCategory" style="width:135px; height:38px;font-size:17px; font-weight: 100;">
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
				</div>
			</div>
			
		
			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="col-sm-3">
					<input type="text" name="productPrice" class="form-control" id="productPrice">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">배송비</label>
				<div class="col-sm-3">
					<input type="text" name="productDelivery_price" class="form-control" id="productDelivery_price" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">모델명</label>
				<div class="col-sm-3">
					<input type="text" name="productModel" class="form-control" id="productModel"  >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">브랜드명</label>
				<div class="col-sm-3">
					<input type="text" name="productMaker" class="form-control" id="productMaker" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조국</label>
				<div class="col-sm-3">
					<input type="text" name="productMadein" class="form-control" id="productMadein" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고</label>
				<div class="col-sm-3">
					<input type="text" name="productStock" class="form-control" id="productStock" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">판매자</label>
				<div class="col-sm-3">
					<input type="text" name="productSeller" class="form-control" id="productSeller" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">미리보기이미지</label>
				<div class="col-sm-3">
					<input type="file" name="productPreview" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세이미지</label>
				<div class="col-sm-3">
					<input type="file" name="productImages" multiple="multiple" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-3">
					<textarea name="productContent" cols="50" rows="5" id="productContent" ></textarea>
				</div>
			</div>
			
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" >
				</div>
			</div>
			
		</form>
		
	</div>
