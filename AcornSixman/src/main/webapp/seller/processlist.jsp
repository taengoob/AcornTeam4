<%@page import="java.util.Date"%>
<%@page import="com.dto.ProcessListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style>
/* Google Web Font */
@import url('https://fonts.googleapis.com/css?family=Montserrat:300,400,500&display=swap');
* {
    box-sizing: border-box;
}
body {
    font-family: 'Montserrat', sans-serif;
    margin: 0;
    color: #333;
    font-size: 15px;
    line-height: 1.6em;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
/* Table */
.member {
    width: 900px;
    background-color: #fff;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
    border-radius: 5px;
    overflow: hidden;
}
.member tr {
    border-bottom: 1px solid #eee;
}
.member tr:first-child {
	 text-align: center; 
    border-bottom: 1px solid #eee;
}
.member tr:last-child {
    border: none;
}
.member tr:nth-child(odd) {
    background-color: #ddd;
}
.member th,
.member tr td:first-child {
    color: crimson;
    font-weight: 500;
}
.member td {
	
    padding: 12px;
    text-align: center; 
}
.member tr th {
    background-color: royalblue;
    color: #fff;
}
.member tr th:first-child {
	
    border-radius: 5px 0 0 0;
}
.member tr th:last-child {
    border-radius: 0 5px 0 0;
}
.member tr td:last-child {
}
</style>

<body>
<%
	List<ProcessListDTO> list = (List<ProcessListDTO>) request.getAttribute("list");
	%> 
	
	
    <table class="member">
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
