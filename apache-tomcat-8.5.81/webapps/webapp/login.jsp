<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>login</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userid");
		String pass = request.getParameter("passwd");
		out.print("사용자id : " + id + "<br />");
		out.print("비밀번호 : " + pass + "<br />");
		
		if(id.equals("홍길동"))
			out.print("회원인증" + "<br>");
		else
		{
			request.setAttribute("test", "회원인증 필요");
			RequestDispatcher dis = request.getRequestDispatcher("responseRedirect.jsp");
			dis.forward(request, response);	
		}
		%>
	</body>
</html>
