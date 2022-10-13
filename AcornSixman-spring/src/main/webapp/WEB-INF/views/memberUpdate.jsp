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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" type="text/css"
	href="static/css/include.css?after">
<style type="text/css">
.namefor-id{
font-size: 20px;
color: blue;
font-weight: bold;
}
</style>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			  로그아웃 완료. 다음에 또 만나요^^;;
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-primary" onclick="location.href='logout'">확인</button>
			</div>
		  </div>
		</div>
	  </div>
	<div class="menu-item">
		<!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/memberUpdate.jsp" flush="true"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
</body>
</html>