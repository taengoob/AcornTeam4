<%@page import="com.acorn.sixman.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="static/css/sample.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="static/css/include.css?after">
<title>Insert title here</title>
<%
String findid =(String) session.getAttribute("findid");
if(findid != null){
%>
<script type="text/javascript">
alert("일치하는 계정이 없습니다.정보를 다시 입력해주세요.")
</script>
<%session.removeAttribute("findid"); }%>
</head>
<body>
	<div class="menu-item">
		<!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		
	</div>
	<div class="wide"></div>
	<jsp:include page="member/firstfindid.jsp" flush="true"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>

</body>
</html>