<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="member/Maincss/sample.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
<title>Insert title here</title>

<%
request.setCharacterEncoding("utf-8");
String mesg1 = (String) session.getAttribute("userid");
String mesg = (String) session.getAttribute("name");
 if(mesg1 == null) {
	%>
</head>
<body>
	<div class="menu-item">
		<!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/findid.jsp" flush="true"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
	<% } else if (mesg1 != null) {
		%>
	<script type="text/javascript">
	alert("<%=mesg%>님의 아이디는 <%=mesg1%> 입니다.");
		</script>
</head>
<body>
	<div class="menu-item">
		<!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/Login.jsp" flush="true"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
	<%
			session.removeAttribute("userid");
			session.removeAttribute("name");
			} 
			%>

</body>
</html>