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
<%
    EmpDTO dto = (EmpDTO)request.getAttribute("dto");
    int empno = dto.getEmpno();
    String ename = dto.getEname();
    String job = dto.getJob();
    int mgr = dto.getMgr();
    String hiredate = dto.getHiredate();
    int sal = dto.getSal();
    double comm = dto.getComm();
    int deptno = dto.getDeptno();
%>
<b>[ 사원 정보 보기 ]</b>
<div style="color:red"> 직업(job)과 월급(sal) 만 수정 가능하도록 구현한다.</div>
	<form action="EmpUpdateServlet" method="post">
	  <input type="hidden" name="empno" value="<%=empno %>" >
 		<table border="1">
			<tr>
				<th>사원번호</th>
				<td>&nbsp;<%=empno %></input>
				</td>
			</tr>
			<tr>
				<th>사원이름</th>
				<td>&nbsp;<%=ename %>
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
				<select name="job">
				  <option value="CLERK" <% if( job.equals("CLERK")){ %> selected <% } %>>CLERK</option>
				  <option value="MANAGER" <% if( job.equals("MANAGER")){ %> selected <% } %>>MANAGER</option>
				  <option value="ANALYST" <% if( job.equals("ANALYST")){ %> selected <% } %>>ANALYST</option>
				  <option value="SALESMAN" <% if( job.equals("SALESMAN")){ %> selected <% } %>>SALESMAN</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>관리자</th>
				<td>&nbsp;<%=mgr %>
				</td>
			</tr>
			<tr>
				<th>입사일</th>
				<td>&nbsp;<%=hiredate %>
				</td>
			</tr>
			<tr>
				<th>월급</th>
				<td><input type="text" name="sal" value="<%=sal %>" ></input>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="사원수정"></input>
				</th>				
			</tr>

		</table>
	</form>
	<a href="EmpListServlet">목록보기</a>&nbsp;
	<a href="EmpDeleteServlet?empno=<%=empno %>">삭제</a>
</body>
</html>