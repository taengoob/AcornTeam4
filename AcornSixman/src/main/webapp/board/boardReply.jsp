<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.BoardDTO" %>
<%@page import="com.dto.BoardPageDTO" %>
<%@page import="com.dto.MemberDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%

	String userId = "";
	Object obj = session.getAttribute("login");
	if (obj != null)
	{
		MemberDTO user = (MemberDTO)obj;
		userId = user.getAccountId();
	}

%>
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
	<div class="col-sm-11" id="replybody" style="display: width: 95%; margin: auto;">
	<% 
		Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
		if(map==null){
	%>
		<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
		<div class="w-100" style="height: 60px;"><h2>&nbsp;&nbsp;-댓글이 없습니다.-</h2></div>
	<%
		}else{
			List<BoardDTO> list = (List<BoardDTO>) map.get("list");
			for (int i = 0; i < list.size(); i++) {
				BoardDTO xxx = list.get(i);
	%>
		<div class="row" id="reply" style="width: 100%;">
			<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>
			<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;"><%=xxx.getBoardUserId() %></div>
			<div class="col-sm-6" style="width: 780px;"><%=xxx.getBoardContent() %></div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
			<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>
			<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>
			<a class="btn btn-outline-secondary btn-sm" id="replybtn3" data-xxx="<%=xxx.getBoardRealContentId()%>">답글</a>
			<span style="float: right;"><br><%=xxx.getBoardRegDate() %></span>
			</div>
		</div>
		<div style="height: 20px; width: 100%; margin: auto;"></div>
		<div id="reply<%=xxx.getBoardRealContentId() %>"></div>		
	<%
		if(map.get("list"+i)!=null) {
			List<BoardDTO> list2 = (List<BoardDTO>) map.get("list"+i);
			for (int j = 0; j < list2.size(); j++) {
				BoardDTO yyy = list2.get(j);
	%>			
		<div class="row" id="reply" style="width: 100%;">
			<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
			<div style="width:70px"></div>
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>
			<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;"><%=yyy.getBoardUserId() %></div>
			<div class="col-sm-6" style="width: 710px;"><%=yyy.getBoardContent() %></div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
			<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>
			<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>
			<a class="btn btn-outline-secondary btn-sm" id="replybtn3">답글</a>
			<span style="float: right;"><br><%=yyy.getBoardRegDate() %></span>
			</div>
		</div>
		<div style="height: 20px; width: 100%; margin: auto;"></div>
		<div id="reply<%=yyy.getBoardRealContentId() %>"></div>							
	<%			
		if(map.get("list"+i+j)!=null) {
			List<BoardDTO> list3 = (List<BoardDTO>) map.get("list"+i+j);
			for (int k = 0; k < list3.size(); k++) {
				BoardDTO zzz = list3.get(k);
	%>			
		<div class="row" id="reply" style="width: 100%;">
			<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
			<div style="width:140px"></div>
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>
			<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;"><%=zzz.getBoardUserId() %></div>
			<div class="col-sm-6" style="width: 640px;"><%=zzz.getBoardContent() %></div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
			<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>
			<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>
			<a class="btn btn-outline-secondary btn-sm" id="replybtn3">답글</a>
			<span style="float: right;"><br><%=zzz.getBoardRegDate() %></span>
			</div>
		</div>
		<div style="height: 20px; width: 100%; margin: auto;"></div>
		<div id="reply<%=zzz.getBoardRealContentId() %>"></div>			
				
				
	<%			
					}
				}
			}
		}
	}
	%>	
		
		
		
		<div class="row" id="reply" style="width: 100%;">
			<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>
			<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;">닉네임</div>
			<div class="col-sm-6" style="width: 780px;">
			</div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
				<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>
				<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>
				<a class="btn btn-outline-secondary btn-sm" id="replybtn3">답글</a>
				<span style="float: right;"><br>2022/08/15 16:33:24</span>
			</div>
		</div>
		<div style="height: 20px; width: 100%; margin: auto;"></div>
		<div id="reply1"></div>
		
		<%
		}
		%>	
		
		
	
	</div>
	<div class="form-floating col-sm-11" style="display: width: 95%; margin: auto;">
		<div style="height: 50px; width: 100%; border-top: 2px solid grey; margin: auto;"></div>
		<div class="form-floating col-sm-11" style="margin: auto; position: relative;">
			<textarea class="form-control" id="replyarea" maxlength="360" spellcheck="false"></textarea>
			<label for="floatingTextarea" id="replylabel">
				<span id="replyUserId">
					<%if(userId!=null){%><%=userId %><%}else{%>로그인이 필요합니다.<%}%>
				</span>
			</label>
			<a id="replyBtn" class="btn btn-outline-secondary">등록</a>
		</div>
		<div class="w-900" style="height: 30px;"></div>
	</div>
</div>
<div class="container" style="height: 0px;"></div>
<script type="text/javascript">

	$(document).ready(function() {
		$("#replyBtn").on("click", replyAdd);
	})
	
	function replyAdd() {//댓글 추가
		var ContentId = $(this).attr("data-xxx");
		if(ContentId==null){
			ContentId = $("#RealContentId").val();
		}
		var UserId = document.getElementById("replyUserId").innerText;
		var ReplyContent = document.getElementById("replyarea").value;
		if(UserId!=null){
			$.ajax({
				type: "post",
				url: "BoardReplyAddServlet",
				data:{
					ContentId: ContentId,
					UserId: UserId,
					ReplyContent: ReplyContent
				},
				dataType: "text",
				success: function(data, status, xhr) {
					console.log("성공");
					showHtml(JSON.parse(data), ContentId);
				},
				error: function(xhr, status, error) {
					
				}
			})//end ajax
		}else{
			alert("로그인이 필요합니다");
		}
	}
	
	function showHtml(data, ContentId) {
		var html = "";
		$.each(data, function(i, ele) {
			html += '<div class="row" id="reply" style="width: 100%;">'
				 + '<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>'
				 + '<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px;"></div>'	
				 + '<div class="col-sm-2" style="height: 60px; width: 120px; text-align: center; line-height: 60px;">유저아이디</div>'	
				 + '<div class="col-sm-6" style="width: 780px;">댓글내용</div>'	
				 + '<div class="col-sm-2" style="width: 190px; right: -10px;">'	
				 + '<a class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</a>'	
				 + '<a class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</a>'	
				 + '<a class="btn btn-outline-secondary btn-sm" id="replybtn3" data-xxx="콘텐트아이디">답글</a>'	
				 + '<span style="float: right;"><br>댓글생성날짜</span>'	
				 + '</div>'	
				 + '</div>'	
				 + '<div style="height: 20px; width: 100%; margin: auto;"></div>'	
				 + '<div id="reply콘텐츠아이디"></div>';	
		})
		
		$("#reply"+ContentId).append(html);
		if($("#reply"+ContentId).val()==null){
			$("#replybody").append(html);
		}
		$("#replyarea").val("");
		$("#replyarea").focus();
	}
	

</script>