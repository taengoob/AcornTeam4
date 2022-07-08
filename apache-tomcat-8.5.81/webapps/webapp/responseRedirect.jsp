<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseRedirect</title>
</head>
<body>
	<h1>responseRedirect</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String msg = (String)request.getAttribute("test");
	String id = request.getParameter("userid");
	String pass = request.getParameter("passwd");
	out.print("사용자id : " + id + "<br />");
	out.print("비밀번호 : " + pass + "<br />");
	out.print(msg);
	%>
</body>
</html>