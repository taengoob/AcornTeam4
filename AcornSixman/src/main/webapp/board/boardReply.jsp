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
	
	Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
	int replyCount = (int)map.get("replyCount");

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
	#replyAddBtn{
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
			<div style="float: left; margin-left: 40px;">
				<h2>댓글&nbsp;<span id="replyCount"><%if(replyCount!=0){%><%=replyCount %><%} %></span></h2>
			</div>
			<a href="#" style="float: left; margin-left: 60px;">등록순</a>
			<a href="#" style="float: left; margin-left: 20px;">최신순</a>
		</div>
	</div>
	<div class="col-sm-11" id="replybody" style="display: width: 95%; margin: auto;">
	<%
		List<BoardDTO> list = (List<BoardDTO>) map.get("list");
		for (int i = 0; i < list.size(); i++) {
			BoardDTO xxx = list.get(i);
	%>	<div>
			<div class="row" id="reply" style="width: 100%;">
				<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
				<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px; margin-top: 10px;"></div>
				<div class="col-sm-2" style="height: 79px; width: 120px; text-align: center; line-height: 60px;"><%=xxx.getBoardUserId() %></div>
				<div class="col-sm-6" style="width: 780px;"><%=xxx.getBoardContent() %></div>
				<div class="col-sm-2" style="width: 190px; right: -10px;">
				<button class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn3" onclick="showReplyArea(this)"
				 data-xxx="<%=xxx.getBoardRealContentId()%>" data-width1="70" data-width2="710">답글</button>
				<span style="float: right;"><br><%=xxx.getBoardRegDate() %></span>
				</div>
			</div>
			<div style="height: 20px; width: 100%; margin: auto;"></div>
			<div id="reply<%=xxx.getBoardRealContentId()%>"></div>	
		</div>	
	<%
		if(map.get("list"+i)!=null) {
			List<BoardDTO> list2 = (List<BoardDTO>) map.get("list"+i);
			for (int j = 0; j < list2.size(); j++) {
				BoardDTO yyy = list2.get(j);
	%>	<div>		
			<div class="row" id="reply" style="width: 100%;">
				<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
				<div style="width:70px; height: 79px;">
					<img src="upload/reply2.png" width="50px;" height="50px;" style="margin-left: 25px;">
				</div>
				<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left:30px;  margin-top: 10px;"></div>
				<div class="col-sm-2" style="height: 79px; width: 120px; text-align: center; line-height: 79px;"><%=yyy.getBoardUserId() %></div>
				<div class="col-sm-6" style="width: 710px;"><%=yyy.getBoardContent() %></div>
				<div class="col-sm-2" style="width: 190px; right: -10px;">
				<button class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn3" onclick="showReplyArea(this)"
				 data-xxx="<%=yyy.getBoardRealContentId()%>" data-width1="140" data-width2="640">답글</button>
				<span style="float: right;"><br><%=yyy.getBoardRegDate() %></span>
				</div>
			</div>
			<div style="height: 20px; width: 100%; margin: auto;"></div>
			<div id="reply<%=yyy.getBoardRealContentId()%>"></div>
		</div>							
	<%			
		if(map.get("list"+i+j)!=null) {
			List<BoardDTO> list3 = (List<BoardDTO>) map.get("list"+i+j);
			for (int k = 0; k < list3.size(); k++) {
				BoardDTO zzz = list3.get(k);
	%>			
		<div class="row" id="reply" style="width: 100%;">
			<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>
			<div style="width:140px; height: 79px;">
				<img src="upload/reply2.png" width="50px;" height="50px;" style="margin-left: 95px;">
			</div>
			<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px; margin-top: 10px;"></div>
			<div class="col-sm-2" style="height: 79px; width: 120px; text-align: center; line-height: 79px;"><%=zzz.getBoardUserId() %></div>
			<div class="col-sm-6" style="width: 640px;"><%=zzz.getBoardContent() %></div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
			<button class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</button>
			<button class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</button>
			<%-- <button class="btn btn-outline-secondary btn-sm" id="replybtn3"
			 data-xxx="<%=zzz.getBoardRealContentId()%>" data-width1="140" data-width2="640">답글</button> --%>
			<span style="float: right;"><br><%=zzz.getBoardRegDate() %></span>
			</div>
		</div>
		<div style="height: 20px; width: 100%; margin: auto;"></div>
		<div id="reply<%=zzz.getBoardRealContentId()%>"></div>			
				
				
	<%			
					}
				}
			}
		}
	}
	%>	
	
		
		
	
	</div>
	<div class="form-floating col-sm-11" style="display: width: 95%; margin: auto;">
		<div style="height: 50px; width: 100%; border-top: 2px solid grey; margin: auto;"></div>
		<div class="form-floating col-sm-11" style="margin: auto; position: relative;">
			<textarea class="form-control" id="replyarea" maxlength="360" spellcheck="false"></textarea>
			<label for="floatingTextarea" id="replylabel">
				<span id="replyUserId"><%=userId %></span>
			</label>
			<button id="replyAddBtn" class="btn btn-outline-secondary reply" onclick="replyAdd(this)" data-width1=" " data-width2="780">등록</button>
		</div>
		<div class="w-900" style="height: 30px;"></div>
	</div>
</div>
<div class="container" style="height: 0px;"></div>
<script type="text/javascript">

	$(document).ready(function() {
		/* $("button[id='replyAddBtn']").on("click", replyAdd); */
		/* $("button[id='replybtn3']").on("click", showReplyArea); */
	})
	
	function replyAdd(e) {//댓글 추가
		var ContentId = $(e).attr("data-xxx");
		if(ContentId=='undefined'||ContentId==null){ContentId = $("#RealContentId").val();}
		var width1 = $(e).attr("data-width1");
		var width2 = $(e).attr("data-width2");
		console.log("게시글아이디: "+ContentId+"너비: "+width1, width2);
		var UserId = $("#replyUserId").text();
		var ReplyContent = $("#replyarea"+ContentId).val();
		if(!ReplyContent){ReplyContent=$("#replyarea").val();}
		if(UserId.length!=0||UserId!="undefined"){
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
					showHtml(JSON.parse(data), ContentId, width1, width2);
				},
				error: function(xhr, status, error) {
					
				}
			})//end ajax
		}else{
			alert("로그인이 필요합니다");
		}
	}
	
	function showHtml(data, ContentId, width1, width2) {
		var html = "";
		$.each(data, function(i, ele) {
			html += '<div class="row" id="reply" style="width: 100%;">'
				 + '<div style="height: 20px; width: 100%; margin: auto; border-top: 2px solid grey;"></div>';
			if(width2=="710"){
					html += '<div style="width:'+width1+'px; height: '+width1+'px;">'
						 +  '<img src="upload/reply2.png" width="50px;" height="50px;" style="margin-left: 25px;"></div>';
			}else if(width2=="640"){
					html += '<div style="width:'+width1+'px; height: '+70+'px;">'
						 +  '<img src="upload/reply2.png" width="50px;" height="50px;" style="margin-left: 95px;"></div>';
			}
			html += '<div class="col-sm-2" style="height: 60px; width: 60px; background-color: pink; margin-left: 30px; margin-top: 10px;"></div>'	
				 + '<div class="col-sm-2" style="height: 79px; width: 120px; text-align: center; line-height: 79px;">'+ele.boardUserId+'</div>'	
				 + '<div class="col-sm-6" style="width:'+width2+'px; min-height:79px;">'+ele.boardContent +'</div>'	
				 + '<div class="col-sm-2" style="width: 190px; right: -10px;">'	
				 + '<button class="btn btn-outline-secondary btn-sm" id="replybtn1">삭제</button>'	
				 + '<button class="btn btn-outline-secondary btn-sm" id="replybtn2">수정</button>';
			if(width2!="640"){
				if(width1==" "){width1="0";}
				html +='<button class="btn btn-outline-secondary btn-sm" id="replybtn3" onclick="showReplyArea(this)"' 
					 + ' data-xxx="'+ele.boardRealContentId+'" data-width1="'+(parseInt(width1)+70)+'" data-width2="'+(parseInt(width2)-70)+'">답글</button>'
					 + '<span style="float: right;"><br>'+ele.boardRegDate+'</span></div>'	
					 + '</div><div style="height: 20px; width: 100%; margin: auto;"></div>'	
					 + '<div id="reply'+ele.boardRealContentId+'"></div>';
			}else{ 
				html += '<span style="float: right;"><br>'+ele.boardRegDate+'</span></div>'	
				     + '</div><div style="height: 20px; width: 100%; margin: auto;"></div>'
					 + '</div><div id="reply'+ele.boardRealContentId+'"></div>';	
			}	
		})
		$("#reply"+ContentId).after(html);
		if($("#reply"+ContentId).val()==null){
			$("#replybody").append(html);
			$("#replyarea").val("");
			$("#replyarea").focus();
		}else{
			$("#replyarea"+ContentId).val("");
			$("#replybox"+ContentId).css('display', "none");
		}
		var replyCount = $("#replyCount").text();
		if(replyCount==null){
			$("#replyCount").text(1);
		}else{
			$("#replyCount").text(parseInt(replyCount)+1);
		}
	}
	
	function showReplyArea(e) {
		var UserId = $("#replyUserId").text();
		var ContentId = $(e).attr("data-xxx");
		var width1 = $(e).attr("data-width1");
		var width2 = $(e).attr("data-width2");
		console.log(width1, width2);
		console.log(ContentId);
		var	html = "";
			html += '<div class="form-floating col-sm-11" id="replybox'+ContentId+'" style="display: width: 95%; margin: auto;">'
			     + '<div style="height: 30px; width: 100%; border-top: 2px solid grey; margin: auto;">'
				 + '</div><div class="form-floating col-sm-11" style="margin: auto; position: relative;">'
			     + '<textarea class="form-control reply" id="replyarea'+ContentId+'" maxlength="360" spellcheck="false"'
			     + 'style="height: 160px; resize: none; padding: 40px 50px 40px 50px; position: relative;"></textarea>'
			     + '<label for="floatingTextarea" id="replylabel">'
			     + '<span id="replyUserId">'+UserId+'</span></label>'
			     + '<button id="replyAddBtn" class="btn btn-outline-secondary" onclick=" replyAdd(this)" data-width1="'+width1+'" data-width2="'+width2+'" data-xxx="'+ContentId+'">등록</button>'
			     + '</div><div class="w-900" style="height: 30px;"></div></div>';
		if($("#replybox"+ContentId).css('display') === 'block' ){
			$("#replybox"+ContentId).hide();
		}else if($("#replybox"+ContentId).css('display') === 'none'){
			$("#replybox"+ContentId).css('display',"block");
			$("#replyarea"+ContentId).focus();
		}else{
			$("#reply"+ContentId).append(html);
			$("#replyarea"+ContentId).focus();
		}
	}
</script>