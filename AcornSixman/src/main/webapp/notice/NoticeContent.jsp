<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
글쓰기에서 가져온 데이터 를 받아 내용 표시
<h1>제목</h1>
내용
<form action="NoticeUpdateServlet" method="get">
<input type="submit" value="수정">
</form>

<a href="NoticeDeleteServlet"><button>삭제</button></a>
