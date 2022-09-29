<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

	.head{
		width: 100%;
		height: 110px;
		background-color: white;
	}
	.boxtop{
		width: 100%;
		height: 30px;
		background-color: #f4f4f4;
		border-top-left-radius: 10px;
  		border-top-right-radius: 10px;
 		margin: auto;
	}
	#deletebtn{
		border: 1px solid grey;
		height: 35px;
		width: 110px;
		font-weight: bold;
		color: grey;
		margin-bottom: 20px;
		float: right;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#checkAbtn").on("click", checkAll);
		$("#deletebtn").on("click", deleteSelect);
	})
	
	function checkAll() {
		if(this.checked){
			$(".chkProduct").prop("checked", true);
		}else{
			$(".chkProduct").prop("checked", false);
		}
		console.log("전체체크 버튼");
		var total = 0;
		var totalDel = 0;
		var totalDis = 0;
		var chkCount = 0;
		var chkedProduct = $("input:checkbox[name=chkProduct]:checked");
		$.each(chkedProduct, function(i, ele) {
			total += parseInt($(ele).attr("data-zzz"));
			totalDel += parseInt($(ele).attr("data-vvv"));
			totalDis += parseInt($(ele).attr("data-DisPrice"));
			console.log(total);
			chkCount++;
		})
		$("#totalPrice").text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#totalDelPrice").text(totalDel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#totalDisperPrice").text(totalDis.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		total+=totalDel - totalDis;
		$("#totalSumPrice").text(total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$("#chkCount").text(chkCount);
	}
	
	function deleteSelect() {
		var chkedCartId = new Array();
		var chkedProduct = $("input:checkbox[name=chkProduct]:checked")
		var index = 0;
		$.each(chkedProduct, function(i, ele) {
			chkedCartId.push($(ele).attr("data-www"));
			index++;
		})
		console.log(chkedCartId);
		$.ajax({
				type: "get",
				url: "CartDeleteServlet",
				traditional : true,
				data:{
					chkedCartId: chkedCartId
				},
				dataType: "text",
				success: function(data, status, xhr) {
					alert(index+"건 삭제완료");
					location.href="CartListServlet";
				},
				error: function(xhr, status, error) {
					console.log("ajax 비동기처리 실패 : "+error);
				}
			})
	}
	
</script>

<div class="head">
<div style="width: 100%; height: 20px;"></div>
<div style="width: 100%; height: 60px;">
	<div style="width:1200px; margin: auto;">
		<div style="width:300px; height: 60px; float:left; font-size: 24px; line-height:60px; font-weight: bold;">장바구니</div>
		<div align= "right" style="width:550px; height: 60px; float: right; line-height:60px; font-size: 15px;">
			장바구니>주문/결제>완료
		</div>
	</div>
</div>    
<hr style="background-color: #f4f4f4;">
<div style="width: 1200px; height: 40px; margin: auto;">
	<div align="left" style="width: 600px; float: left; margin-top: 4px">
		<input type="checkbox" checked="checked" id="checkAbtn">&nbsp;전체선택
	</div>
		<button id="deletebtn">x 선택 삭제</button>
</div>
<br>
</div>
