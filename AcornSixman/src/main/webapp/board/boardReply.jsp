<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.BoardDTO" %>
<%@page import="com.dto.BoardPageDTO" %>
<%@page import="com.dto.MemberDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
	#replyBox{
		/* border: 1px solid grey;
		border-collapse: collapse;
		border-radius: 10px; */
		
	}
	#replyarea{
		height: 160px;
		resize: none;
		padding: 40px 50px 40px 50px;
		position: relative;
	}
	#replylabel{
		font-size: 25px;
		font-weight: bold;
	}
	#replyBtn{
		position: absolute;
		right: 20px;
		top: 110px;

	}
	#reply{
	
	}
	#replybtn1,#replybtn2,#replybtn3{
		float: right;
		margin-left: 8px;
	}
</style>
<script type="text/javascript">

</script>
<div class="container" style="height: 30px;"></div>
<div class="container" id="replyBox">
	<div class="w-100" style="height: 20px;"></div>
	<div>
		<div class="w-100" style="height: 50px;">
			<span style="float: left; margin-left: 40px;"><h2>댓글</h2></span>
			<a href="#" style="float: left; margin-left: 20px;">등록순</a>
			<a href="#" style="float: left; margin-left: 20px;">최신순</a>
		</div>
	</div>
	<div class="col-sm-11" id="boardReply" style="display: width: 95%; margin: auto;">
		<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
		<div class="row" id="reply" style="width: 100%;">
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>
			<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;">닉네임</div>
			<div class="col-sm-6" style="width: 780px;">
				line-height:line-height:line-height:line-height:line-height:line-height:line-height:line-height:line-height:line-height:li
				ight:line-height:
			</div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
				<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>
				<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>
				<a class="btn btn-outline-secondary btn-sm" id="replybtn3">답글</a>
				<span style="float: right;"><br>2022/08/15 16:33:24</span>
			</div>
		</div>
		<div class="w-100" style="height: 20px;"></div>
		<div style="height: 20px; width: 100%; margin: auto; border-top: 1px solid grey;"></div>
		<div class="row" id="reply" style="width: 100%;">
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>
			<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;">닉네임</div>
			<div class="col-sm-6" style="width: 780px;">
				line-height:line-height:line-height:line-height:line-height:line-height:line-height:line-height:line-height:line-height:li
				ight:line-height:
			</div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
				<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>
				<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>
				<a class="btn btn-outline-secondary btn-sm" id="replybtn3">답글</a>
				<span style="float: right;"><br>2022/08/15 16:33:24</span>
			</div>
		</div>
		<div style="height: 20px; width: 100%; margin: auto;"></div>
	</div>
	<div class="form-floating col-sm-11" style="display: width: 95%; margin: auto;">
		<div style="height: 50px; width: 100%; border-top: 2px solid grey; margin: auto;"></div>
		<div class="form-floating col-sm-11" style="margin: auto; position: relative;">
			<textarea class="form-control" id="replyarea" maxlength="360" spellcheck="false"></textarea>
			<label for="floatingTextarea" id="replylabel">닉네임</label>
			<a id="replyBtn" class="btn btn-outline-secondary">등록</a>
		</div>
		<div class="w-900" style="height: 30px;"></div>
	</div>
</div>
<div class="container" style="height: 0px;"></div>