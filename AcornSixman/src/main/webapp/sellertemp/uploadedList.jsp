<%@page import="com.dto.ProductDTO_Temp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#product {
	font-weight: bold;
	color: blue;
}
</style>
</head>

<%
	List<ProductDTO_Temp> products = (List<ProductDTO_Temp>)request.getAttribute("products");
	%>


<body>
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0">
					<tr>
						<td><a href="ProductUploadFormServlet" id="product">*제품 등록*</a>&nbsp;</td>
						<td><a href="ProductAddServlet" id="Add">*제품 등록(수정중)*</a>&nbsp;</td>
						<td><a href="ProductListServlet1" id="List">*판매자 상품리스트*</a>&nbsp;</td>
						<td><a href="ProcessListServlet" id="product">*주문처리현황*</a>&nbsp;</td>
					</tr>

					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>
					<%-- <tr>
						<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
						<%
						for(int i = 1; i <= products.size(); i++) {
							ProductDTO_Temp product = products.get(i - 1);//주의 번호를  1부터 시작(한줄에 보이는 갯수 조절위해)  실제 idx는 0 부터임 
						%>
						<td>
							<table style='padding: 15px'>
								<tr>
									<td><a>
											<!-- 이미지링크 --> <img src="<%= product.getPreviewUrl() %>"
											border="0" align="middle" width="200">
									</a></td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_default" align="center"><a class="a_black">
											<%= product.getProductName() %>
									</a><br> <font color="gray"> -------------------- </font></td>

								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align="center"><%= product.getProductContent() %></td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align="center"><font color="red"><strong><%= product.getProductPrice() %></strong></font>
									</td>
								</tr>
							</table>
						</td>
						<!-- 한줄에 4개씩 보여주기 -->
						<%
							if(i % 4 == 0) {
							%>
					
					<tr>
						<td height="10">
					</tr>
					<%
							}//end if
							%>
					<%
						}//end for
						%> --%>
				</table>
			</td>
		</tr>
		<tr>
			<td height="10">
		</tr>
		
	</table>
</body>
</html>