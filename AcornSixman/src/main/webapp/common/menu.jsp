<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
MemberDTO dto = (MemberDTO) session.getAttribute("login");

if (dto != null) {
	String username = dto.getAccountName();
%>
<%=username%>님 환영합니다.

<a class="top" href="logoutServlet">로그아웃</a>
<a class="top" href="MyPageServlet">mypage</a>
<a class="top" href="#">장바구니</a>
<%
} else {
%>
<a class="top" href="LoginUIservlet">로그인</a>
<a class="top" href="MainJoinUpServlet">회원가입</a>
<%
}
%>

