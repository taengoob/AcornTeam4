<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var imgArray = new Array();
		imgArray[0] = "image/banner1.png";
		imgArray[1] = "image/banner2.png";
		imgArray[2] = "image/banner3.png";
		imgArray[3] = "image/banner4.png";
		setInterval(function xxx() {
			console.log("xxx호출")
			console.log($("#banner").attr("src"));
			if ($("#banner").attr("src") == imgArray[0]) {
				$("#banner").attr("src", imgArray[1]);
				$("#span1").text("○");
				$("#span2").text("●");
				$("#span3").text("○");
				$("#span4").text("○");
			} else if ($("#banner").attr("src") == imgArray[1]) {
				$("#banner").attr("src", imgArray[2]);
				$("#span1").text("○");
				$("#span2").text("○");
				$("#span3").text("●");
				$("#span4").text("○");
			} else if ($("#banner").attr("src") == imgArray[2]) {
				$("#banner").attr("src", imgArray[3]);
				$("#span1").text("○");
				$("#span2").text("○");
				$("#span3").text("○");
				$("#span4").text("●");
			} else if ($("#banner").attr("src") == imgArray[3]) {
				$("#banner").attr("src", imgArray[0]);
				$("#span1").text("●");
				$("#span2").text("○");
				$("#span3").text("○");
				$("#span4").text("○");
			}
		}, 5000);
		$("#span1").click(function() {
			$("#banner").attr("src", imgArray[0]);
			$("#span1").text("●");
			$("#span2").text("○");
			$("#span3").text("○");
			$("#span4").text("○");
		})
		$("#span2").click(function() {
			$("#banner").attr("src", imgArray[1]);
			$("#span1").text("○");
			$("#span2").text("●");
			$("#span3").text("○");
			$("#span4").text("○");
		})
		$("#span3").click(function() {
			$("#banner").attr("src", imgArray[2]);
			$("#span1").text("○");
			$("#span2").text("○");
			$("#span3").text("●");
			$("#span4").text("○");
		})
		$("#span4").click(function() {
			$("#banner").attr("src", imgArray[3]);
			$("#span1").text("○");
			$("#span2").text("○");
			$("#span3").text("○");
			$("#span4").text("●");
		})
	})
</script>
<style type="text/css">
#box2 {
	margin: auto;
	width: 1200px;
	height: 420px;
}

#box3 {
	margin: auto;
	width: 100%;
	height: 10px;
}

#box4 {
	margin: auto;
	width: 100%;
	height: 20px;
}

#box5 {
	margin: auto;
	width: 100%;
	height: 20px;
}

#pre {
	text-align: center;
	width: 100%;
	height: 20px;
}

span {
	margin-left: 30px;
}

span:hover {
	cursor: pointer;
}
</style>
<div id="box3"></div>
<div id="box2">
	<img src="image/banner1.png" name="banner" width="1200px;"
		height="420px;" id="banner">
</div>

<div id="box5">
	<pre id="pre">
		<span id="span1">●</span><span id="span2">○</span><span id="span3">○</span><span
			id="span4">○</span>
	</pre>
</div>
<div id="box4"></div>