<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>장바구니 페이지</title>
    <link rel="stylesheet" type="text/css" href="static/css/include.css" />
    <style type="text/css">
      body {
        margin: 0;
        padding: 0;
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
          <div class="modal-body">로그아웃 완료. 다음에 또 만나요^^;;</div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="location.href='logout'">확인</button>
          </div>
        </div>
      </div>
    </div>
    <div class="menu-item">
      <jsp:include page="common/menu.jsp" flush="true"></jsp:include><br />
      <jsp:include page="common/top.jsp" flush="true"></jsp:include>
    </div>
    <div class="wide"></div>
    <jsp:include page="cart/cartmenu.jsp" flush="true"></jsp:include><br />
    <jsp:include page="cart/cartlist2.jsp" flush="true"></jsp:include><br />
    <jsp:include page="common/bot.jsp" flush="true"></jsp:include><br />
  </body>
</html>
