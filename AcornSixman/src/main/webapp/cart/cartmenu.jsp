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

</style>
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
		<input type="checkbox" id="allCheck">&nbsp;전체선택
	</div>
	<div align="right"><button>x 전체 삭제</button>&nbsp;&nbsp;<button>x 선택 삭제</button></div>
</div>
</div>