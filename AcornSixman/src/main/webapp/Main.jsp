<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css"
	href="member/Maincss/include.css?after">

<%
request.setCharacterEncoding("utf-8");
String mesg = (String) session.getAttribute("memberupdate");
String logout = (String) session.getAttribute("logout");
if (mesg != null) {
%>
<script type="text/javascript">
		alert("<%=mesg%>");
</script>
<%
session.removeAttribute("memberupdate");
}
%>
<%
if (logout != null){
%>
<script type="text/javascript">
		alert("로그아웃 완료. 다음에 또 만나요 ~^^");
</script>
<%
session.removeAttribute("logout");
}
%>
</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="common/search.jsp"></jsp:include>
	<hr>
	<jsp:include page="common/banner.jsp"></jsp:include>
	<hr>
	<jsp:include page="common/youtube.jsp"></jsp:include> 
	<hr>
	<jsp:include page="common/fieximage.jsp"></jsp:include> 
	<hr>
	<jsp:include page="common/fieximage2.jsp"></jsp:include> 
	<jsp:include page="coupon/bannertest.html"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
	<hr>
	<jsp:include page="common/mesg.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	var mainText = document.querySelector("#picyou");
	window.addEventListener('scroll',function(){
		var value = window.scrollY
		console.log("스크롤 y" , value)
		
		if (value > 1200) {
			mainText.style.animation="slide 2s ease-out";
		}
		else{
			mainText.style.animation="dis 2s ease-out";
			
		}
		
	})
	</script>
</body>
</html>