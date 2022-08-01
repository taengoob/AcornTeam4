<%@page import="com.service.ProductService"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String [] ProductId = request.getParameterValues("delCheck");
    List<String> x = Arrays.asList(ProductId);
    ProductService service = new ProductService();
     int n = service.deleteAll(x);

%>   
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
history.back()
</script>
</head>
<body>

</body>
</html>