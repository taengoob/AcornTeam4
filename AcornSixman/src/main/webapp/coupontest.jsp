<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" src="styles.css"></style>
<script type="text/javascript">

	function xxx() {
		var href = "CouponTestServlet"
		location.href=href;
	}
	
</script>
</head>
<body>
<h1>쿠폰 테스트</h1>
<button onclick="xxx()">쿠폰생성</button>


<div id="app"></div>
<script src="roulette.js"></script>
</body>
</html>