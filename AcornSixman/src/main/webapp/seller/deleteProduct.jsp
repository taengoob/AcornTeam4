<%@page import="com.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String ProductId = request.getParameter("ProductId");

    ProductService service = new ProductService();
     int n = service.delete(ProductId);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
</body>
</html>
