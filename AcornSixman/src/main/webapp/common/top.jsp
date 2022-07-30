<%@page import="com.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<img src="member/img/logo.png" height="70px" width="250px">
<%
List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("Guitar");

for (int i = 0; i < list.size(); i++) {
	CategoryDTO dto = list.get(i);
	String id = dto.getCategoryId();
%>
<a class="top" href="#?<%=id%>"><%=id%></a>
<%
}
%>
