<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDTO dto = (MemberDTO) session.getAttribute("login");

if (dto != null ) {
	String username = dto.getAccountName();
	String seller = dto.getAccountIsSeller();
	if(seller == "False"){
%>
<a class="top-menu"><%=username%>님 환영합니다.</a>
<a class="top-menu" href="logoutServlet">로그아웃</a>
<a class="top-menu" href="MyPageServlet">마이페이지</a>
<a class="top-menu" href="CartListServlet">장바구니</a>
<%
} else {
%>
<a class="top-menu"><%=username%>님 환영합니다.</a>
<a class="top-menu" href="logoutServlet">로그아웃</a>
<a class="top-menu" href="MyPageServlet">마이페이지</a>
<a class="top-menu" href="image/ImageUploadFormServlet">제품등록</a>
<% 	
}
%>	
<% 
} else {
%>
<a class="top" href="LoginUIservlet">로그인</a>
<a class="top" href="MainJoinUpServlet">회원가입</a>
<%
}
%>

<%-- if (dto != null && dto.getAccountIsSeller() == "True") {
%>
<a class="top-menu" href="logoutServlet">로그아웃</a>
<a class="top-menu" href="MyPageServlet">마이페이지</a>
<a class="top-menu" href="ImageUploadFormServlet">제품등록</a>
<%
}  --%>
