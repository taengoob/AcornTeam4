<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	text-decoration: none;
}
</style>
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">

<%
request.setCharacterEncoding("utf-8");
String mesg = (String) session.getAttribute("memberupdate");
if (mesg != null) {
%>
<script type="text/javascript">
		alert("<%=mesg%>");
</script>
<%
session.removeAttribute("mesg");
}
%>

</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
		
	</div><div class="wide"></div>
	<jsp:include page="common/search.jsp"></jsp:include>
	<hr>
	<jsp:include page="common/banner.jsp"></jsp:include>
	<hr>
	<jsp:include page="coupon/bannertest.html"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
	<hr>
	<jsp:include page="common/mesg.jsp"></jsp:include>
</body>
</html>