<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.ProductDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	List<ProductDTO> list = (List<ProductDTO>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face { /* 애플산돌고딕 폰트 적용 */
	 	font-family: "GSMedium";
	 	src: url("fonts/GmarketSansTTFMedium.ttf") format("truetype");
	  	font-weight: normal;
	}
	*{
		font-family: "GSMedium";
	}
	.top{
		width: 100%;
		height: 80px;
		background-color: grey;
	}
	.head{
		width: 100%;
		height: 110px;
		background-color: white;
	}
	.tabaleboxout{
		width: 100%;
		background-color: #f4f4f4;
 		margin: auto;
	}
	.tablebox{
		width: 850px;
  		border-radius : 10px;
  		background-color: white; /* #f4f4f4; */
 		margin: auto;
	}
	.bottom{
		width: 100%;
		height: 300px;
	}
	.listbox{
		width: 100%;
		height: 800px;
		background-color: #f4f4f4;
		display: flex; 
		align-items: center;
	}
	#productlist{
		width: 900px;
		height: 700px;
		margin: auto;
		background-color: white;
		border-collapse: collapse;
		border: 1px solid #bcbcbc;
		border-radius : 10px;
	}
</style>
<script type="text/javascript">


	function yyy(s) {
		console.log(s);
		var href ="CartAddServlet?product_Id="+s;
		console.log(href);
		location.href=href;
	}
	
	function goCart() {
		var href ="CartPageServlet";
		console.log(href);
		location.href=href;
	}
	
</script>
</head>
<body>

<div class="top"></div>
<div class="head">
<div style="width: 100%; height: 60px;">
	<div style="width:850px; margin: auto;">
		<div style="width:300px; height: 60px; float:left; font-size: 24px; line-height:60px;">상품목록</div>
		<div align= "right" style="width:550px; height: 60px; float: right; line-height:60px; font-size: 12px;">
			<button onclick="goCart()">장바구니</button>
		</div>
	</div>
</div>
<hr style="background-color: #f4f4f4;">
<div style="width: 800px; height: 40px; margin: auto;">
	<div align="left" style="width: 600px; float: left;"><input type="checkbox">&nbsp;전체선택</div>
	<div align="right">
		<select>
			<option>가격순</option>
			<option>판매량순</option>
			<option>이름순</option>
		</select>
	</div>
</div>
</div>
<div class="listbox">
<div id="productlist">
<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
				
<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
 <%
 	for(int i=0; i<list.size(); i++){ 
		ProductDTO pdto = list.get(i);
		String product_Id = pdto.getProduct_Id();
		String Product_Name = pdto.getProduct_Name();
		String Product_Maker = pdto.getProduct_Maker();
		int Product_Price = pdto.getProduct_Price();	  
 %>
						<td>
							<table style='padding:15px'>
								<tr>
									<td>
										<a href="GoodsRetrieveServlet?gCode=T1"> 
											<img src="image/guitar0<%=i+1 %>.png" border="0" align="center" width="150">
										</a>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href=""><%=Product_Name %>
										<br>
										</a>
										<font color="gray">
										 --------------------
										</font>
									</td>
									
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align ="center">
										<%=Product_Maker %>
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red"><strong>
									<%=Product_Price %>원
										</strong></font></td>
								</tr>
								<tr>
									<td>
										<button onclick="yyy('<%=product_Id%>')">장바구니에 넣기</button>
									</td>
								</tr>
							</table>
						</td>
					<!-- 한줄에 4개씩 보여주기 -->	
				   <%
				    if((i+1)%4==0){
				   %>
				       <tr>
				        <td height="10">
				       </tr>
				   <%
				    } //end if
				   %>		
						
<%
   }   //end for
%>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
</div>
</div>
<div class="bottom">
<div class="totalpriceTop"></div>
<div class="totalprice">
</div>
</div>
</body>
</html>