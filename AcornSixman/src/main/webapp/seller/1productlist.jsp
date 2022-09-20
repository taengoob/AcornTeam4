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

<style type="text/css">
/* 상세설명 */
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
  /* 상품명 */
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
  /* 본문 */
  .container1 {
  width: 80%;
  margin: 0 auto;
}

tr,th,td {
  text-align: center;
  /* border : 1px solid black; */
}
 /* 페이지 a태그 */
  

.a {
    width: 1%;
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
.e {
    width: 10%;
  }
.f {
    width: 10%;
  }
.g {
    width: 15%;
  }
.h {
    width: 10%;
  }
#i {
    width: 5.5%;
  }
  .aa img {
  transition: all 0.2s linear;
}
.aa:hover img {
  transform: scale(1.8);
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

	 <%
	 
	 ProductPageDTO pDTO = (ProductPageDTO) request.getAttribute("pDTO");
	 List<ProductDTO_Temp> list = pDTO.getList();
	 String searchName = (String)request.getAttribute("searchName");
	 String search = (String)request.getAttribute("search");
	%> 
	

 <div class="container1" id="top"> 
<h1>상품리스트</h1>
<hr>
			<form action="ProductSearchServlet">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con" style="width:10%">제품명</label>
				<input type="text" class="form-control" id="id" name="search"
					placeholder="" style="display: inline; width: 20%;">&nbsp;&nbsp;
					<!-- <input type="submit" value="검색"> -->
					<button type="submit" class="btn btn-outline-primary">검색</button>
			</div>
			</form>
 			<br>
	 <form action="ProductListServlet1">
	 <div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con" style="width:10%">카테고리</label>
				<select   class="form-select" style="display: inline; width: 20%;" name="searchName" id="searchName" 
					onchange="this.form.submit()">
					 
					<option value="all" id="all" ${searchName == 'all' ? 'selected="selected"' : '' }>전체보기</option>
						<option value="Acoustic" id="Acoustic" ${searchName == 'Acoustic' ? 'selected="selected"' : '' }>Acoustic</option>
						<option value="Bass" id="Bass" ${searchName == 'Bass' ? 'selected="selected"' : '' }>Bass</option>
						<option value="Classic" id="Classic" ${searchName == 'Classic' ? 'selected="selected"' : '' }>Classic</option>
						<option value="Elec" id="Elec" ${searchName == 'Elec' ? 'selected="selected"' : '' }>Elec</option>
						<option value="Ukulele" id="Ukulele" ${searchName == 'Ukulele' ? 'selected="selected"' : '' }>Ukulele</option>
					 
				</select>
			</div>
	</form>
		<hr>
		 
		 
			<form id="delForm">
			
<table  class="table table-striped" >
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
	

	<tr class="basketlist">
	    <td class="a" ><input type="checkbox" name="delCheck"  class="delCheck" value="<%= dto.getProductId()%>"></td>
	
		<td   class="b">
		<div class="productName"> 
		<%=productName%><br>
		<a href="ProductRetrieveServlet?ProductId=<%=ProductId%>" style="color: red;">  [상품 편집] </a>
		</div>
		</td>
		<td class="c" >
			<div class="aa"> <img src="<%=previewUrl %>" width="78px" height="78px"></div>
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
		 
		<button type="button" id="button_<%=ProductId%>" value="<%=ProductStock%>">
 			  <%=ProductStock%>
  		<span  id="span_<%=ProductId%>">
   			 
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
		
		  	        <td id="i" ><button onclick=" if(confirm('삭제 하시겠습니까?')){
						location.href='seller/deleteProduct.jsp?ProductId=<%= dto.getProductId()%>'}"  class="btn btn-outline-danger">삭제</button></td> 
		
	</tr>
	 <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		
		var x = $("#button_<%=ProductId%>");
		var y = $("#span_<%=ProductId%>");
	
		console.log("y.text",y.text());
		console.log("x.text",x.val());
		if (x.val()<=3) {
			x.addClass('btn btn-primary position-relative');
			y.addClass('position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger');
			y.text("재고부족");
		}else{
			x.attr('disabled',true);
			x.css('border',0);
			x.css('color', 'black');
		}
		
		
	})
	</script> 
	
  <%} %>
  </table>
  </form>
  
  <tr>
		 <td> 
		   <%
		        int curPage = pDTO.getCurPage();
		        int perPage = pDTO.getPerPage();
				int totalCount = pDTO.getTotalCount();
				int totalPage = totalCount/perPage;
				if(totalCount%perPage!=0) totalPage++;
		        for(int i=1; i<= totalPage; i++){
		        	
		        	 if(i== curPage){
		          		%>
		          		<%-- <a   href="ProductListServlet1?curPage=<%=i %>&searchName=<%=searchName %>"><%=i %></a> --%>
		          		<button class="btn btn-outline-primary" onclick = "location.href ='ProductListServlet1?curPage=<%=i %>&searchName=<%=searchName %>'"><%=i %></button>
		          	<% }else{%>
		          		<%-- <a   href="ProductListServlet1?curPage=<%=i %>&searchName=<%=searchName %>"><%=i %></a>  --%>
		          		<button class="btn btn-outline-primary" onclick = "location.href ='ProductListServlet1?curPage=<%=i %>&searchName=<%=searchName %>'"><%=i %></button>
		          	<% }%>
		      <%  }//end for
		  			 %>   
		          
		
		  </td>
		</tr>
		<br>
		<br>
			<button id="deleteAllProduct" onclick="delAll()" class="btn btn-outline-danger">선택 항목 삭제</button>
			</div>
</body>
</html>