<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="static/css/include.css" />
    <style type="text/css"></style>
    <meta charset="UTF-8" />
    <title>공지사항</title>
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
      <jsp:include page="common/top.jsp" flush="true"></jsp:include>
      <jsp:include page="common/menu.jsp" flush="true"></jsp:include>
    </div>
    <div class="wide"></div>
    <jsp:include page="common/search.jsp"></jsp:include>
    <hr />
    <jsp:include page="board/boardReWrite.jsp" flush="true"></jsp:include>
    <jsp:include page="common/bot.jsp" flush="true"></jsp:include>
    <hr />
    <jsp:include page="common/mesg.jsp" flush="true"></jsp:include>
  </body>
</html>
