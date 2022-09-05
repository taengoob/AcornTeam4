<%@page import="java.util.Date"%>
<%@page import="com.dto.ProductPageDTO"%>
<%@page import="com.service.ProductService"%>
<%@page import="com.dto.ProductDTO_Temp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function chk(n) {
		var lang= document.querySelectorAll(".delCheck");
		for(var i=0; i< lang.length; i++){
			lang[i].checked= n.checked;
		}
	}
	function delAll() {
		document.querySelector("#delForm").action='seller/deleteAllProduct.jsp';
	}
	function delProduct(n) {
		 event.preventDefault(); /*location.href전에 event.preventDefault()사용  */
		location.href="deleteProduct.jsp?prodId="+n;		
	}
</script>
</head>
<body>
<link rel="stylesheet" href="css/bootstrap.min.css">
	 <%
	 
	 ProductPageDTO pDTO = (ProductPageDTO) request.getAttribute("pDTO");
	 List<ProductDTO_Temp> list = pDTO.getList();
	 String searchName = (String)request.getAttribute("searchName");
	 String search = (String)request.getAttribute("search");
	%> 
	
	

<h1>상품리스트</h1>
<hr>
		<tr>
			<td colspan="5">
				<form action="ProductListServlet1">
					<select name="searchName" id="searchName" 
					onchange="this.form.submit()"
					>
						<option >카테고리별 검색</option>
						<option value="all" id="all" ${searchName == 'all' ? 'selected="selected"' : '' }>전체보기</option>
						<option value="Acoustic" id="Acoustic" ${searchName == 'Acoustic' ? 'selected="selected"' : '' }>Acoustic</option>
						<option value="Bass" id="Bass" ${searchName == 'Bass' ? 'selected="selected"' : '' }>Bass</option>
						<option value="Classic" id="Classic" ${searchName == 'Classic' ? 'selected="selected"' : '' }>Classic</option>
						<option value="Elec" id="Elec" ${searchName == 'Elec' ? 'selected="selected"' : '' }>Elec</option>
						<option value="Ukulele" id="Ukulele" ${searchName == 'Ukulele' ? 'selected="selected"' : '' }>Ukulele</option>
					</select> 
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<form action="ProductSearchServlet">
					상품명 <input type="text" name="search"> 
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
			<form id="delForm">
<table border="1" class="table table-striped">
<tr>
	</tr>
 	<tr>
 
	  <th colspan="2"><input type="checkbox" name="delCheckAll" id="delCheckAll" onclick="chk(this)">전체선택 </th>
  	  <th colspan="2">상품명</th>
  	  <th colspan="4">상품이미지</th>
  	  <th colspan="2">상품금액</th>
  	  <th colspan="2">배송료</th>
  	  <th colspan="2">재고</th>
  	  <th colspan="2">상세설명</th>
  	  <th colspan="2">분류</th>
  	  <th colspan="2">삭제</th>
  	  
 	</tr>
 	<%
   for(ProductDTO_Temp dto: list){
	   
	  String ProductId = dto.getProductId();
	  String productName = dto.getProductName();
	  int ProductPrice = dto.getProductPrice();
	  int ProductDeliveryPrice = dto.getProductDeliveryPrice();
	  int ProductStock = dto.getProductStock();
	  String ProductContent = dto.getProductContent();
	  String ProductCategory = dto.getProductCategory();
	  String previewUrl = dto.getPreviewUrl();
	  Date productRegDate = dto.getProductRegDate();

	  
	 %> 
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		var x = $("#<%=ProductStock%>");
		if (x.text()<=5) {
			x.css("color","red");
			x.wrap("<span></span>").css("border","3px dotted red");
		}
	})
	</script>

	<tr class="basketlist">
	    <td colspan="2"><input type="checkbox" name="delCheck"  class="delCheck" value="<%= dto.getProductId()%>"></td>
	
		<td colspan="2">
		<%=productName%><br>
		<a href="ProductRetrieveServlet?productName=<%=productName%>" style="color: red;">  [상품 편집] </a>
		
		</td>
		<td colspan="4">
			<img src="<%=previewUrl %>" width="78px" height="78px">
		</td>
		<td colspan="2">
			<%=ProductPrice%>
		</td>	
		<td colspan="2">
			<%=ProductDeliveryPrice%>
		</td>
		<td colspan="2" id="<%=ProductStock%>">
			<%=ProductStock%>
		</td>
		<td colspan="2">
			<%=ProductContent%>
		</td>
		<td colspan="2">
			<%=ProductCategory%>
		</td>
		
		  	        <td><button onclick="  if(confirm('삭제 하시겠습니까?')){
						location.href='seller/deleteProduct.jsp?ProductId=<%= dto.getProductId()%>'}
						" >삭제</button></td> 
		
	</tr>
	</form>
  <%} %>
  <tr>
		 <td colspan="5"> 
		   <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		        	
		          	if(i== curPage){
		          		out.print(i+"&nbsp;");
		          	}else{
		          		out.print("<a href='ProductListServlet1?curPage="+i+"&searchName="+searchName+"'>"+i+"</a>&nbsp;");
		          	}
		        }//end for
		   %> 
		
		  </td>
		</tr>
</table>

			<button id="deleteAllProduct" onclick="delAll()">선택 항목 삭제</button>
</body>
</html>