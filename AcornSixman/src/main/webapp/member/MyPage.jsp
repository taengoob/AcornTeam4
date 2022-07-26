<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-latest.min.js" text="text/javascript"></script>
        
   <title>주문</title>
   <style>
    *{
    margin:0; padding:0;
    box-sizing:border-box;
    font-family: 'Noto Sans KR', sans-serif;
   }
 a{
  text-decoration:none;
  }
ul li{
  list-style:none;
}
.order-one{
   
    font-size:25px;
    margin-top:3%;
    display:inline-block;
    margin-left:2.5%;
}
.order-one-item{
    color:rgb(133, 133, 133);
}
.order-one-write{
    margin:0 auto;
    border:1px solid #929292;
    height:250px;
    margin-top:1%;
    width:95%;
    
}
.order-one-write-item1,
.order-one-write-item2,
.order-one-write-item3,
.order-one-write-item4{
    border:1px solid #dbdbdb;
    display:inline-block;
    text-align:center;
    width:20%;
    padding:20px;
}
.order-one-write-item4{
    width:40%;
}
.order-one-write-item1-1,
.order-one-write-item2-1,
.order-one-write-item3-1,
.order-one-write-item4-1{
    border:1px solid #dbdbdb;
    float:left;
    width:20%;
    height:182px;
    
}
.order-one-write-item4-1{
    width:40%;
}
.order-two{
    font-size:25px;
    margin-top:3%;
    display:inline-block;
    margin-left:2.5%;
}
.order-two-item{
    color:rgb(133, 133, 133);
}
.order-two-write{
    border-top:1px solid #929292;
    border-bottom:1px solid #929292;
    width:95%;
    margin:0 auto;
    margin-top:1%;
    height:300px;
}
.order-two-write-item1,
.order-two-write-item2,
.order-two-write-item3,
.order-two-write-item4,
.order-two-write-item5{
float:left;
text-align:center;
background-color:#f5f5f5;
font-size:15px;
padding:10px;
border-bottom:1px solid #929292;
}
.order-two-write-item1{
    width:10%;
}
.order-two-write-item2{
    width:40%;
}
.order-two-write-item3{
    width:20%;
}
.order-two-write-item4{
    width:15%;
}
.order-two-write-item5{
    width:15%;
}
   </style>

   
   </head>




   <body>
   <strong class="order-one">진행 중인 주문</strong>
   <span class="order-one-item">최근 30일 내에 진행중인 주문정보입니다.</span>
   <div class="order-one-write">
    <p class="order-one-write-item1">결제완료</p><p class="order-one-write-item2">준비중인 상품</p><p class="order-one-write-item3">배송중인 상품</p><p class="order-one-write-item4">배송완료</p>
    <p class="order-one-write-item1-1"></p>
    <p class="order-one-write-item2-1"></p>
    <p class="order-one-write-item3-1"></p>
    <p class="order-one-write-item4-1"></p>
   </div>
   <strong class="order-two">최근 주문 정보</strong>
   <span class="order-two-item">최근 30일 내에 주문하신 내역입니다.</span>
   <div class="order-two-write">
    <p class="order-two-write-item1">날짜/주문번호</p>
    <p class="order-two-write-item2">상품명/옵션</p>
    <p class="order-two-write-item3">상품금액/수량</p>
    <p class="order-two-write-item4">주문상태</p>
    <p class="order-two-write-item5">확인/리뷰</p>
   </div>

    </body>
</html>