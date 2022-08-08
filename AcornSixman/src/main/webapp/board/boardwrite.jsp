<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style type="text/css">
#texttitle{
margin-bottom: 10px;
width: 410px;
}
#textsubmit1{
margin: auto;
}
#textsubmit2{
margin: auto;
}
</style>
<form action="NoticeServlet" method="get">
제목:<input type="text" value="" id="texttitle"><br>
<textarea rows="30px" cols="60px"></textarea><br>
<input type="submit" value="등록" id="textsubmit1"><input type="reset" value="취소" id="textsubmit2">
</form>