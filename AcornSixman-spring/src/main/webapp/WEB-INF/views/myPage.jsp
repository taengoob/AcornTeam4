<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="static/css/MyPage.css">
<link rel="stylesheet" type="text/css" href="static/css/include.css?after">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.update{
	color: blue;
	font-size: 30px;
	font-weight: bold;	
}

.tabaleboxout {
	width: 77%;
	background-color: #f4f4f4;
	margin: auto;
}

.tablebox {
	width: 100%;
	border-radius: 10px;
	background-color: white; /* #f4f4f4; */
	margin: auto;
}

.listtable {
	border: 1px solid #bcbcbc;
	width: 100%;
	table-layout: fixed;
	margin: auto;
	background-color: white;
	border-collapse: collapse;
	/* border-radius: 10px; */
	border-style: hidden;
	box-shadow: 0 0 0 1px white;
}

.listtable tr, td {
	border-color: #f4f4f4;
}

.tablebot {
	height: 60px;
	width: 100%;
}

td {
	text-align: center;
	font-size: 12px;
}

.basketlist {
	width: 100%;
	height: 80px;
}

.selectbox {
	float: left;
	text-align: center;
	position: relative;
	top: 18px;
	left: 10px;
}

/* 아래부터는 bot  */
.bottom {
	width: 100%;
	height: 200px;
}

.totalprice {
	text-align: center;
	margin: auto;
	background-color: white;
	width: 600px;
	height: 100px;
}

.totalpriceTop {
	margin: auto;
	background-color: white;
	width: 600px;
	height: 30px;
}

.goPaybox {
	text-align: center;
}

.goPay {
	line-height: 40px;
	text-align: center;
	background-color: grey;
	width: 300px;
	height: 60px;
	color: white;
	border-radius: 5px;
	margin: auto;
	display: block;
	border: 0;
	outline: 0;
}

.tptable {
	width: 77%;
	height: 70px;
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: none;
	vertical-align: top;
	margin: auto;
}

.tptable td {
	vertical-align: top;
}

.tptable .totalpricetd {
	vertical-align: middle;
	font-size: 20px;
}

.totalpricetr td {
	font-size: 20px;
}

.totalpricetr {
	font-size: 20px;
	text-align: center;
}

input[type=checkbox] {
	accent-color: grey;
}


.tablebot {
	height: 50px;
	width: 77%;
}

.actionBtn {
	/* 		line-height : 40px; */
	text-align: center;
	background-color: grey;
	color: white;
	border-radius: 1px;
	margin: auto;
	display: block;
	border: 0;
	outline: 0;
}
</style>
</head>
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
		  <button type="button" class="btn btn-primary" onclick="location.href='/logout'">확인</button>
		</div>
	  </div>
	</div>
  </div>

<body>

	<div class="menu-item"> <!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/MyPage.jsp" flush="true"></jsp:include>
	<jsp:include page="order/orderList.jsp"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
	
</body>
</html>