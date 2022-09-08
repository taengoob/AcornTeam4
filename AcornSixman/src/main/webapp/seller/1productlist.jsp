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
<style type="text/css">

    .mydiv{
    height: 78px;
    overflow: auto;
  }
    .mydiv::-webkit-scrollbar {
    width: 10px;
  }
  .mydiv::-webkit-scrollbar-thumb {
    background-color:grey; 
    border-radius: 10px;
  }
  .mydiv::-webkit-scrollbar-track {
    background-color: #CCCCCC;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }   
  
    .productName{
    height: 78px;
    overflow: auto;
  }
    .productName::-webkit-scrollbar {
    width: 10px;
  }
  .productName::-webkit-scrollbar-thumb {
    background-color:grey; 
    border-radius: 10px;
  }
  .productName::-webkit-scrollbar-track {
    background-color: #CCCCCC;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }   
  .container1 {
  width: 75%;
  margin: 0 auto;
}
.a {
    width: 5%;
  }
.b {
    width: 15%;
  }
.c {
    width: 10%;
  }
.d {
    width: 10%;
  }
</style>
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
	

 <div class="container1"> 
<h1>상품리스트</h1>
<hr>



 <div class="row">
    <div class="col align-self-start">
      One of three columns
    </div>
    <div class="col align-self-center">
      One of three columns
    </div>
    <div class="col align-self-end">
      One of three columns
    </div>
  </div>
  
  
  
  
		<tr>
			<td >
				<form action="ProductListServlet1">
				카테고리
					<select name="searchName" id="searchName" 
					onchange="this.form.submit()"
					>
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
			<td >
				<form action="ProductSearchServlet">
					상품명 <input type="text" name="search"> 
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
			<form id="delForm">
			
<table  class="table table-striped">
<tr>
	</tr>
 	<tr>
 
	  <th class="a"><input type="checkbox" name="delCheckAll" id="delCheckAll" onclick="chk(this)"> </th>
  	  <th class="b" >상품명</th>
  	  <th class="c" >상품이미지</th>
  	  <th class="d" >상품금액</th>
  	  <th class="e" >배송료</th>
  	  <th class="f" >재고</th>
  	  <th class="g" >상세설명</th>
  	  <th class="h">분류</th>
  	  <th class="i" >삭제</th>
  	  
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
		
		
		var x = $("#<%=ProductId%>");
		console.log(x);
		if (x.text()<=5) {
			x.css("color","red");
			x.wrap("<span></span>").css("border","3px dotted red");
		
		}
		
		
	})
	</script> 

	<tr class="basketlist">
	    <td class="a" ><input type="checkbox" name="delCheck"  class="delCheck" value="<%= dto.getProductId()%>"></td>
	
		<td   class="b">
		<div class="productName"> 
		<%=productName%><br>
		<a href="ProductRetrieveServlet?productName=<%=productName%>" style="color: red;">  [상품 편집] </a>
		</div>
		</td>
		<td class="c" >
			<img src="<%=previewUrl %>" width="78px" height="78px">
		</td>
		<td  class="d">
			<%=ProductPrice%>
		</td>	
		<td class="e" >
			<%=ProductDeliveryPrice%>
		</td>
		
		
		 
		
		<%--  <td class="f" id="<%=ProductId%>">
			<%=ProductStock%>
		</td>  --%>
		
		
		<!-- ////////////////// -->
		<td class="f" id="<%=ProductId%>">
		 
		<button type="button" class="btn btn-primary position-relative">
 			  <%=ProductStock%>
  		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
   			 재고부족
   		 <span class="visually-hidden">unread messages</span>
  		</span>
		</button>
		</td>
		<!-- ///////////////// -->
		
		
		
		
		<td class="g"  class="jb-th-1">
	   		<div class="mydiv"><%=ProductContent%> </div>  
		</td>
		<td class="h" >
			<%=ProductCategory%>
		</td>
		
		  	        <td class="i"><button onclick="  if(confirm('삭제 하시겠습니까?')){
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
		          		%>
		          		<a href="ProductListServlet1?curPage=<%=i %>&searchName=<%=searchName %>"><%=i %></a>
		          	<% }else{%>
		          		<a href="ProductListServlet1?curPage=<%=i %>&searchName=<%=searchName %>"><%=i %></a> 
		          	<% }%>
		      <%  }//end for
		  			 %> 
		
		  </td>
		</tr>
</table>

			<button id="deleteAllProduct" onclick="delAll()">선택 항목 삭제</button>
			</div>
</body>
</html>