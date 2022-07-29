<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
MemberDTO dto = (MemberDTO) session.getAttribute("login");

if (dto != null) {
	String username = dto.getAccountName();
%>
<%=username%>님 환영합니다.

<a href="logoutServlet">로그아웃</a>
<a href="MyPageServlet">mypage</a>
<a href="#">장바구니</a>
<%
} else {
%>
<a href="LoginUIservlet">로그인</a>
<a href="MainJoinUpServlet">회원가입</a>
<%
}
%>

