<%@page import="java.util.Date"%>
<%@page import="com.dto.ProcessListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.min.css">

<body>
<%
	List<ProcessListDTO> list = (List<ProcessListDTO>) request.getAttribute("list");
	%> 
	
	
    <table border="1">
        <tr>
            <th>처리현황</th>
            <th>주문자ID</th>
            <th>상품명</th>
            <th>수량</th>
            <th>배송지</th>
            <th>고객 전화번호</th>
            <th>주문일</th>
        </tr>
        <%
   for(ProcessListDTO dto: list){
	  String OrderUserId = dto.getOrderUserId();
	  String ProductName = dto.getProductName();
	  int ProductStock = dto.getProductStock();
	  String OrderRecvAddressRoad = dto.getOrderRecvAddressRoad();
	  String OrderRecvPhone = dto.getOrderRecvPhone();
	  Date OrderRegDate = dto.getOrderRegDate();
	 %> 
	 	 <tr>
        	<td></td>
            <td> <%=OrderUserId%></td>
            <td> <%=ProductName%></td>
            <td> <%=ProductStock%></td>
            <td> <%=OrderRecvAddressRoad%></td>
            <td> <%=OrderRecvPhone%></td>
            <td> <%=OrderRegDate%></td>
        </tr>
         <%} %>
    </table>
</body>
</html>
