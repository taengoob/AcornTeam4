<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js
"></script>
<script type="text/javascript">
$(function () {
	var imgArray = new Array();
	imgArray[0] = "image/banner1.png";
	imgArray[1] = "image/banner2.png";
	imgArray[2] = "image/banner3.png";
	imgArray[3] = "image/banner4.png";
setInterval(function xxx() {
	console.log("xxx호출")
	console.log($("#banner").attr("src"));
	if ($("#banner").attr("src")==imgArray[0]) {
			 $("#banner").attr("src",imgArray[1]);
		}else if ($("#banner").attr("src")==imgArray[1]) {
			$("#banner").attr("src",imgArray[2]);
		}else if ($("#banner").attr("src")==imgArray[2]) {
			$("#banner").attr("src",imgArray[3]);
		}else if ($("#banner").attr("src")==imgArray[3]) {
			$("#banner").attr("src",imgArray[0]);
		}
	},3000);
})
</script>
<img src="image/banner1.png" name="banner" id="banner"></img>
