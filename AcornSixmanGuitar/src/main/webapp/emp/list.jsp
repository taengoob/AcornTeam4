<%@page import="java.util.List"%>
<%@page import="com.dto.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
</head>
<body>
	<b>[ 사원 목록 ]</b>
	<hr></hr>
	<%
	List<EmpDTO> list = (List<EmpDTO>) request.getAttribute("list");
	String order = (String)request.getAttribute("order");
	%>
	<table border="1">

		<!-- 검색기능 -->
		<tr>
			<td colspan="5">
				<form action="EmpListServlet">
					<select name="searchName">
						<option value="hiredate">입사일(년도만)</option>
						<option value="ename">이름</option>
					</select> <input type="text" name="searchValue"> <input
						type="submit" value="검색">
				</form>
			</td>
		</tr>
		<!-- 검색기능  -->
		<!-- 정렬기준 -->
		<tr>
			<th>정렬기준</th>
			<td colspan="4">
			  <form action="EmpOrderServlet">
			      월급 높은 순 : <input type="radio" name="order" value="desc" <% if (order == null || order.equals("desc")) { %> checked="checked" <%} %> />
				 월급낮은 순 : <input type="radio" name="order" value="asc" <% if (order != null && order.equals("asc")) { %> checked="checked" <%} %>/>
				  <input type="submit" value="정렬">
               </form>
			</td>
		</tr>

		<!-- 정렬기준 -->
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>직업</th>
			<th>입사일</th>
			<th>월급</th>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
				EmpDTO dto = list.get(i);
				int empno = dto.getEmpno();
				String ename = dto.getEname();
				String job = dto.getJob();
				String hiredate = dto.getHiredate();
				int sal = dto.getSal();
		%>
		<tr>
			<td><a href="EmpRetrieveServlet?empno=<%=empno%>"><%=empno%></a></td>
			<td><%=ename%></td>
			<td><%=job%></td>
			<td><%=hiredate%></td>
			<td><%=sal%></td>
		</tr>
		<%
			} //end for
		%>
	</table>
	<a href="EmpWriteFormServlet">사원등록</a>
</body>
</html>