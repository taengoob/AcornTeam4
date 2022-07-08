<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
</head>
<body>
	Hello <br>
<%
	out.print(page.getClass().getSimpleName() + "<br>");
%>
<%
	ArrayList<String> list = new ArrayList<String>();
// 	out.print(num);
// 	out.print(a);
	list.add("홍길동");
	list.add("강백호");
	list.add("손오공");
	
	for(String str: list)
	{
		out.print(str + "<br>");
	}
%>
	<br>
</body>
</html>