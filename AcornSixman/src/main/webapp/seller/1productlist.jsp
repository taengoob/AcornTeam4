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
	%> 
	
	

<form id="delForm" class="table table-striped">
<h1>상품리스트</h1>
<hr>
		<tr>
			<td colspan="5">
				<form action="ProductListServlet1">
					<select name="searchName" onchange="this.form.submit()">
						<option >카테고리별 검색</option>
						<option value="all">전체보기</option>
						<option value="Acoustic">Acoustic</option>
						<option value="Bass">Bass</option>
						<option value="Classic">Classic</option>
						<option value="Elec">Elec</option>
					</select> 
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
		<div name="all1">전체</div>
		<div name="Acoustic1">Acoustic</div>
		<div name="Bass1">Bass</div>
		<div name="Classic1">Classic</div>
		<div name="Elec1">Elec</div>
<table border="1">
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
	 %> 
	
	<tr class="basketlist">
	    <td colspan="2"><input type="checkbox" name="delCheck"  class="delCheck" value="<%= dto.getProductId()%>"></td>
	
		<td colspan="2">
		<%=productName%>
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
		<td colspan="2">
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
</form>
</body>
</html>