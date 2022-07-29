<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8" />
<head>
<title>Roulette page</title>
<style type="text/css">
	.box{
		width: 600px;
		height: 720px;
		background-size: 100%;
		background-image: url(eventpage.png);
	}
	.rouletter {
	  margin: auto;
	  top: 250px;
	  position: relative;
	  width: 400px;
	  height: 400px;
	}
	.rouletter-bg {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  width: 350px;
	  height: 350px;
	  border-radius: 350px;
	  overflow: hidden;
	}
	.rouletter-wacu {
	  width: 100%;
	  height: 98%;
	  background: #f5f5f2
	    url("roulette2.png");
	    no-repeat;
	  background-size: 100%;
	  transform-origin: center;
	  transition-timing-function: ease-in-out;
	  transition: 2s;
	}
	.rouletter-arrow {
	  position: absolute;
	  top: 0;
	  left: 50%;
	  transform: translateX(-50%);
	  width: 1px;
	  height: 1px;
	  border-right: 10px solid transparent;
	  border-left: 10px solid transparent;
	  border-top: 40px solid red;
	  border-bottom: 0px solid transparent;
	}
	.rouletter-btn {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  width: 80px;
	  height: 80px;
	  border-radius: 80px;
	  background: #fff;
	  border-image: linear-gradient(to right, #fbfcb9be, #ffcdf3aa, #65d3ffaa);
	  border: 2px solid;
	}
	.hidden-input {
	  display: none;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div class="box">
<div id="app"></div>
</div>
<script type="text/javascript">
		
	var rolLength = 6;
	var setNum;
	var hiddenInput = document.createElement("input");
	hiddenInput.className = "hidden-input";

	const rRandom = () => {
	  var min = Math.ceil(0);
	  var max = Math.floor(rolLength - 1);
	  return Math.floor(Math.random() * (max - min)) + min;
	};

	const rRotate = () => {
	  var panel = document.querySelector(".rouletter-wacu");
	  var btn = document.querySelector(".rouletter-btn");
	  var deg = [];
	  for (var i = 1, len = rolLength; i <= len; i++) {
	    deg.push((360 / len) * i);
	  }

	  var num = 0;
	  document.body.append(hiddenInput);
	  setNum = hiddenInput.value = rRandom();

	  var ani = setInterval(() => {
	    num++;
	    panel.style.transform = "rotate(" + 360 * num + "deg)";
	    btn.disabled = true; //button,input
	    btn.style.pointerEvents = "none"; //a 태그

	    if (num === 50) {
	      clearInterval(ani);
	      panel.style.transform = "rotate(" + deg[setNum] + "deg)";
	    }
	  }, 50);
	};

	const rLayerPopup = (num) => {
	  switch (num) {
	    case 1:
	      alert("당첨!! 30% 할인 쿠폰");
	      location.href = "../CouponAddServlet?coupon=1";
	      break;
	    case 3:
	      alert("당첨!! 20% 할인 쿠폰");
	      location.href = "../CouponAddServlet?coupon=3";
	      break;
	    case 5:
	      alert("당첨!! 10% 할인 쿠폰");
	      location.href = "../CouponAddServlet?coupon=5";
	      break;
	    default:
	      alert("꽝! 다음기회에");
	  }
	};

	const rReset = (ele) => {
	  setTimeout(() => {
	    ele.disabled = false;
	    ele.style.pointerEvents = "auto";
	    rLayerPopup(setNum);
	    hiddenInput.remove();
	  }, 5500);
	};

	document.addEventListener("click", function (e) {
	  var target = e.target;
	  if (target.tagName === "BUTTON") {
	    rRotate();
	    rReset(target);
	  }
	});

	document.getElementById("app").innerHTML = `
	<div class="rouletter">
	    <div class="rouletter-bg">
	        <div class="rouletter-wacu"></div>
	    </div>
	    <div class="rouletter-arrow"></div>
	    <button class="rouletter-btn" id="start">start</button>
	</div>
	`;

	
	</script>
</body>

</html>