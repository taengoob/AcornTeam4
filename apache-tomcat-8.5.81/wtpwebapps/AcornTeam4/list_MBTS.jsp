<%@page import="com.emp.service.EmployeeService_MBTS"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.dto.Employee"%>
<%@page import="com.emp.service.EmployeeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	EmployeeService_MBTS service = new EmployeeService_MBTS();
	List<Employee> list = service.getAllEmployee();
	%>

	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>사원월급</th>
			<th>입사일</th>
			<th>부서번호</th>
		</tr>
		<% for(Employee emp : list) { %>
		<tr>
			<td><%= emp.getEMPNO() %></td>
			<td><%= emp.getENAME() %></td>
			<td><%= emp.getSAL() %></td>
			<td><%= emp.getHIREDATE() %></td>
			<td><%= emp.getDEPTNO() %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>