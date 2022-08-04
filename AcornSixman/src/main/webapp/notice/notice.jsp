<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	table{
    margin:auto;
    margin-top: 20px;
}

table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
};
	}
	#noticetable{
	text-align: center;
	
	}
	#noticename{
	width: 300px;
	}
</style>
<div id="noticetable">
<table border="1">
	<tr>
		<th>번호</th><th><div id="noticename">제목</div></th><th>등록날짜</th>
	</tr>
	<tr>
		<td>01</td>
		<td><a href="NoticeContentServlet">식스맨 구매 관련 필독사항</a></td>
		<td>2022/08/04</td>
	</tr>

</table>
</div>
<form action="NoticeWriteServlet" method="get" id="writeform">
<input type="submit" value="글쓰기">
</form>
