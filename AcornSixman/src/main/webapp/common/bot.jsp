<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#bot0{
		width: 100%;
		height: 80px;
	}
	#bot1{
		width: 100%;
		height: 300px;
		border-top:1px solid grey;
		border-bottom: 1px solid grey;
	}
	#bot1boxtop, #bot1boxbot{
		width:100%;
		height: 30px;
	}
	#bot1box{
		margin: auto;
		width: 1100px;
		height: 240px;
	}
	#botTable1{
		width: 600px;
		height: 240px;
		float: left;
	}
	.botTable1font0{
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.botTable1font1{
		font-size: 24px;
		font-weight: bold;
	}
	.botTable1font2{
		font-size: 14px;
		font-weight: bold;
		color: grey;
		margin-top: 7px
	}
	.botTable1font3{
		font-size: 18px;
		font-weight: bold;
		margin-top: 20px
	}
	.botTable1font4{
		font-size: 14px;
		font-weight: bold;
		color: grey;
		margin-top: 10px
	}
	#botTable2{
		width: 150px;
		height: 240px;
		float: left;
		margin-left: 100px;
	}
	#botTable3{
		width: 150px;
		height: 240px;
		float: left;
	}
	
	#bot2{
		width: 100%;
		height: 50px;
	}
	#bot2box{
		margin: auto;
		width: 1100px;
		height: 50px;
	}
	#bot2box>div{
		margin-top: 15px;
		margin-right: 10px;
		font-size: 15px;
		color: grey;
		float: left;
	}
	#bot3{
		width: 100%;
		height: 300px;
		background-color: #fafafa;
	}
	#bot3box{
		margin: auto;
		width: 1100px;
		height: 300px;
	}
	#bot3boxtop{
		height: 40px;
	}
	.botTable1font5{
		font-size: 15px;
		color: grey;
		margin-top: 7px;
	}
	#botTable1font5>span{
		color: black;
		font-weight: bold;
	}
	.botTable1font6{
		font-size: 15px;
		color: grey;
		margin-top: 30px;
	}
</style>
<div id="bot0"></div>
<div id="bot1">
	<div id="bot1boxtop"></div>
	<div id="bot1box">
		<div id="botTable1">
			<div></div>
			<div class="botTable1font0">고객지원센터</div>
			<div class="botTable1font1">카카오톡 : SIXMAN PROJECT</div>
			<div class="botTable1font1">전화번호 : 1588 - 1588</div>
			<div class="botTable1font2">운영시간 : 09:30~18:30/ 점심시간 : 13:30~14:30</div>
			<div class="botTable1font2">토,일, 공휴일 휴무</div>
			<div class="botTable1font3">반품 배송지</div>
			<div class="botTable1font2">서울특별시 강남구 테헤란로 124길 삼원타워 5층</div>
		</div>
		<div id="botTable2">
			<div class="botTable1font0">게시판</div>
			<div class="botTable1font4"><a href="NoticeServlet">공지사항</a></div>
			<div class="botTable1font4">이벤트</div>
			<div class="botTable1font4">포토리뷰</div>
			<div class="botTable1font4">상품 1:1문의</div>
			<div class="botTable1font4">자주하는질문</div>
		</div>
		<div id="botTable3">
			<div class="botTable1font0">즐겨찾는메뉴</div>
			<div class="botTable1font4"><a href="OrderListServlet">마이페이지</a></div>
			<div class="botTable1font4"><a href="CartListServlet">장바구니</a></div>
			<div class="botTable1font4"><a href="OrderListServlet#order-two">주문조회</a></div>
		</div>
		<div id="bot1boxbot"></div>
	</div>
</div>
<div id="bot2">
	<div id="bot2box">
		<div>회사소개</div>
		<div>이용약관</div>
		<div>개인정보처리방침</div>
		<div>이용안내</div>
		<div>제휴/문의</div>
	</div>	
</div>
<div id="bot3">
	<div id="bot3box">
		<div id="bot3boxtop"></div>
		<div class="botTable1font5">
			법인명(상호):주식회사 식스맨&nbsp;&nbsp;&nbsp;&nbsp;
			대표:식스맨&nbsp;&nbsp;&nbsp;&nbsp;
			사업자등록번호: 123-45-678900&nbsp;&nbsp;
			<span>사업자등록번호조회></span>
		</div>
		<div class="botTable1font5">
			통신판매업신고번호: 제 2022-서울강남구-7777호
		</div>
		<div class="botTable1font5">
			개인정보관리자:식스맨&nbsp;&nbsp;&nbsp;&nbsp;
			주소:서울특별시 강남구 테헤란로 124길 삼원타워 5층
		</div>
		<div class="botTable1font5">
			메일: sixman6666@sixman.com&nbsp;&nbsp;&nbsp;&nbsp;
			호스팅제공:AcornAcademy
		</div>
		<div class="botTable1font6">
			Copyright (C) 2022 주식회사 식스맨 .All rights reserved.
		</div>
	</div>	
</div>