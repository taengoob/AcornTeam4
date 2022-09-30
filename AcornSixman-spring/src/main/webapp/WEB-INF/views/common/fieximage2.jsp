<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#fiximage{

	height : 700px;
	background-repeat: no-repeat;
	background-size: 100% 800px;
	background-attachment: fixed;
	color: white;
	background-position: center;
	text-align: center;
	background-image:  url("image/centerimage.jpg");
	opacity: 90%;
}
#picyou{
	font-size: 100px;
	font-size: 8em;
	margin-left : -230px;
	font-family: sans-serif;
	position : absolute;
	
}
@keyframes slide {
	from{
		left : -400px;
		opacity: 0;
		}
	to{
		left : 755px;
		opacity: 1;
		}
}

@keyframes dis {
	from{
		left : 755px;
		opacity: 1;
	}
	to{
		left : -400px;
		opacity: 0;
	}
}
</style>
</head>
<body>
	<section id="fiximage">
	<br>
	<span id="picyou">PICK<BR> YOU<BR> FAVORITE</span>
	</section>
	
</body>
</html>