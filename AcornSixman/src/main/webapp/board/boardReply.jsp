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

	String userId = " ";
	Object obj = session.getAttribute("login");
	if (obj != null)
	{
		MemberDTO user = (MemberDTO)obj;
		userId = user.getAccountId();
	}
	
	Map<String,Object> map = (Map<String,Object>)request.getAttribute("map");
	int replyCount = (int)map.get("replyCount");

%>
<div class="container" style="height: 30px;"></div>
<div class="container" id="replyBox">
	<div class="w-100" style="height: 20px;"></div>
	<div>
		<div class="w-100" style="height: 50px;">
			<div style="float: left; margin-left: 40px;">
				<h2>댓글&nbsp;<span id="replyCount"><%if(replyCount!=0){%><%=replyCount %><%}else{%> <%}%></span></h2>
			</div>
			<a href="#" style="float: left; margin-left: 20px;">등록순</a>
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
				<div class="col-sm-2" id="replyWriteId<%=xxx.getBoardRealContentId()%>" 
				style="height: 79px; width: 120px; text-align: center; line-height: 60px;"><%=xxx.getBoardUserId() %></div>
				<div class="col-sm-6" id="replyContent<%=xxx.getBoardRealContentId()%>" style="width: 780px;">
					<%if(xxx.getBoardDelDate()==null){%><%=xxx.getBoardContent()%><%}else{%> 삭제된 댓글입니다. <%}%>
				</div>
				<div class="col-sm-2" style="width: 190px; right: -10px;">
				<button class="btn btn-outline-secondary btn-sm" id="replybtn1" onclick="replyDelete(this)"
				 data-xxx="<%=xxx.getBoardRealContentId()%>">삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn2" onclick="showReplyArea(this)"
				 data-xxx="<%=xxx.getBoardRealContentId()%>" data-update="update">수정</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn3" onclick="showReplyArea(this)"
				 data-xxx="<%=xxx.getBoardRealContentId()%>" data-width1="70" data-width2="710">답글</button>
				<span style="float: right;"><br><span class="elapsedTime" data-created-date="<%=xxx.getBoardRegDate() %>"></span></span>
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
				<div class="col-sm-2" id="replyWriteId<%=yyy.getBoardRealContentId()%>" 
				style="height: 79px; width: 120px; text-align: center; line-height: 79px;"><%=yyy.getBoardUserId() %></div>
				<div class="col-sm-6" id="replyContent<%=yyy.getBoardRealContentId()%>" style="width: 710px;">
					<%if(yyy.getBoardDelDate()==null){%><%=yyy.getBoardContent()%><%}else{%> 삭제된 댓글입니다. <%}%>
				</div>
				<div class="col-sm-2" style="width: 190px; right: -10px;">
				<button class="btn btn-outline-secondary btn-sm" id="replybtn1" onclick="replyDelete(this)"
				 data-xxx="<%=yyy.getBoardRealContentId()%>">삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn2" onclick="showReplyArea(this)"
				 data-xxx="<%=yyy.getBoardRealContentId()%>" data-update="update">수정</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn3" onclick="showReplyArea(this)"
				 data-xxx="<%=yyy.getBoardRealContentId()%>" data-width1="140" data-width2="640">답글</button>
				<span style="float: right;"><br><span class="elapsedTime" data-created-date="<%=yyy.getBoardRegDate() %>"></span></span>
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
			<div class="col-sm-2" id="replyWriteId<%=zzz.getBoardRealContentId()%>" 
			style="height: 79px; width: 120px; text-align: center; line-height: 79px;"><%=zzz.getBoardUserId()%></div>
			<div class="col-sm-6" id="replyContent<%=zzz.getBoardRealContentId()%>" style="width: 640px;">
				<%if(zzz.getBoardDelDate()==null){%><%=zzz.getBoardContent()%><%}else{%> 삭제된 댓글입니다. <%}%>
			</div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
			<button class="btn btn-outline-secondary btn-sm" id="replybtn1" onclick="replyDelete(this)"
				 data-xxx="<%=zzz.getBoardRealContentId()%>">삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn2" onclick="showReplyArea(this)"
				 data-xxx="<%=zzz.getBoardRealContentId()%>" data-update="update">수정</button>
			<div style="clear: right; margin: 60px -30px 0px 120px;" class="elapsedTime" data-created-date="<%=zzz.getBoardRegDate() %>"></div>
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
				<span id="replyUserId"><%if(userId!=" "){%><%=userId %><%}else{%>로그인이 필요합니다.<%} %></span>
			</label>
			<button id="replyAddBtn" class="btn btn-outline-secondary reply" onclick="replyAdd(this)" data-width1=" " data-width2="780">등록</button>
		</div>
		<div class="w-900" style="height: 30px;"></div>
	</div>
</div>
<div class="container" style="height: 0px;"></div>
<script src="board/boardJS/boardReply.js"></script>
<script type="text/javascript">
	

	function replyUpdate(e) {
		var ContentId = $(e).attr("data-xxx");
		var ReplyContent = $("#replyarea"+ContentId).val();
		if(window.confirm("정말 댓글을 수정하시겠습니까?")){
			$.ajax({
				type: "post",
				url: "BoardReplyUpdateServlet",
				data:{
					ContentId: ContentId,
					ReplyContent: ReplyContent
				},
				dataType: "text",
				success: function(data, status, xhr) {
					console.log("댓글수정 성공");
					$("#replyContent"+ContentId).text(data);
					$("#replyarea"+ContentId).val("");
					$("#replybox"+ContentId).css('display', "none");
				},
				error: function(xhr, status, error) {
					
				}
			})//end ajax
		}else{
			alert("수정이 취소되었습니다.");
		}
	}
	
	function replyDelete(e) {
		var ContentId = $(e).attr("data-xxx");
		var UserId = $("#replyUserId").text();
		var replyWriteId = $("#replyWriteId"+ContentId).text();
		console.log("로그인중인 아이디"+UserId+"댓글작성 아이디"+replyWriteId);
		if(UserId==replyWriteId||UserId=="taengoov"){
			if(window.confirm("정말 댓글을 삭제하시겠습니까?")){
				$.ajax({
					type: "post",
					url: "BoardReplyUpdateServlet",
					data:{
						ContentId: ContentId
					},
					dataType: "text",
					success: function(data, status, xhr) {
						console.log("댓글삭제 성공");
						$("#replyContent"+ContentId).text(data);
					},
					error: function(xhr, status, error) {
						
					}
				})//end ajax
			}else{
				alert("삭제가 취소되었습니다.");
			}
		}else{
			alert("삭제 권한이 없습니다.");
		}
	}
	
	function replyAdd(e) {//댓글 추가
		var ContentId = $(e).attr("data-xxx");//참조할 댓글의 고유ID, 다른 댓글이 없을경우 게시판 ID를 참조
		if(ContentId=='undefined'||ContentId==null){ContentId = $("#RealContentId").val();}
		var width1 = $(e).attr("data-width1");//원댓글의 html 사이즈1
		var width2 = $(e).attr("data-width2");//원댓글의 html 사이즈2
		console.log("게시글아이디: "+ContentId+"너비: "+width1, width2);
		var UserId = $("#replyUserId").text();//작성자ID
		var ReplyContent = $("#replyarea"+ContentId).val();//댓글내용, 대댓글일 경우 답글버튼 클릭시 생성된 textarea의 value값을 가져옴
		if(!ReplyContent){ReplyContent=$("#replyarea").val();}//댓글내용, 다른 댓글이 없을경우 기본 댓글 textarea의 value값을 가져옴
		console.log("아이디: "+UserId+"아이디의 길이:"+UserId.length);
		if(UserId!="로그인이 필요합니다."){//로그인 체크
			$.ajax({
				type: "post",
				url: "BoardReplyAddServlet",
				data:{
					ContentId: ContentId,
					UserId: UserId,
					ReplyContent: ReplyContent
				},
				dataType: "text",
				success: function(data, status, xhr) {//비동기 처리에 성공할 경우 Servlet에서 댓글의 정보를 List 에서 Json 형식으로 변환해서 받아옴
					console.log("성공"+JSON.parse(data));
					showHtml(JSON.parse(data), ContentId, width1, width2);//받아온 Json data를 이용해서 동적으로 html 생성
					monetJS();//댓글 작성시간 변환 함수작동
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
		var replyNextId = "";
		$.each(data, function(i, ele) {
			replyNextId = ele.boardRelpyNextId;
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
				 + '<div class="col-sm-2" id="replyWriteId'+ele.boardRealContentId+'" style="height: 79px; width: 120px; text-align: center; line-height: 79px;">'+ele.boardUserId+'</div>'	
				 + '<div class="col-sm-6" id="replyContent'+ele.boardRealContentId+'" style="width:'+width2+'px; min-height:79px;">'+ele.boardContent +'</div>'	
				 + '<div class="col-sm-2" style="width: 190px; right: -10px;">'	
				 + '<button class="btn btn-outline-secondary btn-sm" id="replybtn1"'
				 + 'onclick="replyDelete(this)" data-xxx="'+ele.boardRealContentId+'">삭제</button>'	
				 + '<button class="btn btn-outline-secondary btn-sm" id="replybtn2"'
				 + 'onclick="showReplyArea(this)" data-xxx="'+ele.boardRealContentId+'" data-update="update">수정</button>';
			if(width2!="640"){
				if(width1==" "){width1="0";}
				html +='<button class="btn btn-outline-secondary btn-sm" id="replybtn3" onclick="showReplyArea(this)"' 
					 + ' data-xxx="'+ele.boardRealContentId+'" data-width1="'+(parseInt(width1)+70)+'" data-width2="'+(parseInt(width2)-70)+'">답글</button>'
					 + '<span style="float: right;"><br><span class="elapsedTime" data-created-date="'+ele.boardRegDate+'"></span></div>'	
					 + '</div><div style="height: 20px; width: 100%; margin: auto;"></div>'	
					 + '<div id="reply'+ele.boardRealContentId+'"></div>';
			}else{ 
				html += '<div style="clear: right; margin: 60px -30px 0px 120px;" class="elapsedTime" data-created-date="'+ele.boardRegDate+'"></div>'	
				     + '</div><div style="height: 20px; width: 100%; margin: auto;"></div>'
					 + '</div><div id="reply'+ele.boardRealContentId+'"></div>';	
			}	
		})
		if($("#reply"+ContentId).css('display') === 'block'){//대댓글인 경우
			if(replyNextId==" "){//해당 댓글에 다른 대댓글이 없을경우
				console.log("해당 댓글에 다른 대댓글이 없을경우 해당 댓글 아래에 대댓글 추가")
				$("#reply"+ContentId).append(html);//해당 댓글 아래에 대댓글 추가
			}else{//해당 댓글에 다른 대댓글이 있을경우
				console.log("해당 댓글에 다른 대댓글이 있을경우 다른 대댓글들중 가장 나중에 작성한 댓글 아래에 추가")
				$("#reply"+replyNextId).after(html);//다른 대댓글들중 가장 나중에 작성한 댓글 아래에 추가
			}
			$("#replyarea"+ContentId).val("");//텍스트 입력창 비우고
			$("#replybox"+ContentId).css('display', "none");//텍스트 입력창 숨김
		}else{//대댓글이 아닌경우
			if(replyNextId==" "){//해당 게시들에 다른 댓글이 없을경우
				console.log("대댓글x 해당 게시들에 다른 댓글이 없을경우 첫 댓글 추가")
				$("#replybody").append(html);//첫 댓글 추가
			}else{//해당 게시물에 다른 댓글이 있을경우
				console.log("대댓글x 해당 게시물에 다른 댓글이 있을경우 가장 나중에 작성한 댓글 아래에 추가")
				$("#reply"+replyNextId).after(html);//가장 나중에 작성한 댓글 아래에 추가
			}
			$("#replyarea").val("");//텍스트 입력창 비우고
			$("#replyarea").focus();//텍스트 입력창 포커스
		}
		var replyCount = $("#replyCount").text();
		if(replyCount==" "){//댓글이 없을 경우
			$("#replyCount").text(1);//총 댓글수는 1개
		}else{
			$("#replyCount").text(parseInt(replyCount)+1);//댓글이 있을경우 +1
		}
	}
	
	function showReplyArea(e) {
		var ContentId = $(e).attr("data-xxx");
		var replyWriteId = $("#replyWriteId"+ContentId).text();
		var UserId = $("#replyUserId").text();
		var width1 = $(e).attr("data-width1");
		var width2 = $(e).attr("data-width2");
		var Update = $(e).attr("data-update");
		console.log(width1, width2);
		console.log(ContentId);
		var	html = "";
			html += '<div class="form-floating col-sm-11" id="replybox'+ContentId+'" style="display: width: 95%; margin: auto;">'
			     + '<div style="height: 30px; width: 100%; border-top: 2px solid grey; margin: auto;">'
				 + '</div><div class="form-floating col-sm-11" style="margin: auto; position: relative;">'
			     + '<textarea class="form-control reply" id="replyarea'+ContentId+'" maxlength="360" spellcheck="false"'
			     + 'style="height: 160px; resize: none; padding: 40px 50px 40px 50px; position: relative;"></textarea>'
			     + '<label for="floatingTextarea" id="replylabel">'
			     + '<span id="replyUserId">'+UserId+'</span></label>';
		if(Update!=null){//수정 버튼을 클릭한 경우
			html += '<button id="replyUpdateBtn" class="btn btn-outline-secondary" onclick=" replyUpdate(this)" data-xxx="'+ContentId+'">수정</button>';
		}else{//일반적인 대댓글 작성인 경우
			html += '<button id="replyAddBtn" class="btn btn-outline-secondary" onclick=" replyAdd(this)" data-width1="'+width1+'" data-width2="'+width2+'" data-xxx="'+ContentId+'">등록</button>';
		}
			html += '</div><div class="w-900" style="height: 30px;"></div></div>';
			
			console.log("Userid : "+UserId+" WirteID : "+replyWriteId);
		if(Update!=null&&UserId!=replyWriteId){//수정 버튼을 클릭했는데 로그인한 계정과 작성자가 맞지않는 경우
			alert("수정권한이 없습니다.");
		}else{
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
	}
	
	function monetJS() {
		$(".elapsedTime").each(function() {
			 let elapsedTime = getElapsedTime($(this).attr("data-created-date"));
			 $(this).text(elapsedTime);
		});
	}
	// 작성일에 대한 문자열을 전달하면 경과시간을 적절한 단위로 반환하는 함수
	function getElapsedTime(createdDateString) {
		let now = moment();
		let createdDate = moment(createdDateString, 'YYYY-MM-DD HH:mm:ss');
		// 경과시간 정보
		let duration = moment.duration(now.diff(createdDate));
		// 경과시간에 대해 문자열로 표시할 단위 옵션
		let durationOptions = [
			{"dur" : duration.asDays(), "option" : "일 전"},
			{"dur" : duration.asHours(), "option" : "시간 전"},
			{"dur" : duration.asMinutes(), "option" : "분 전"},];
		
		// 반복문으로 duration의 값을 확인해 어떤 단위로 반환할지 결정한다.
		// ex) 0.8년전이면 "8개월 전" 반환
		for (let durOption of durationOptions) {
			if (durOption.dur >= 1) {
				if(durOption.option == '일 전'&& durOption.dur > 7){
					return moment(createdDateString).format("YYYY-MM-DD");
				}else{
					return Math.round(durOption.dur) + durOption.option;
				}
			}
		}
		// 분 단위로 검사해도 1 이상이 아니면(반복문에서 함수가 종료되지 않으면) "방금 전" 반환
		return "방금 전";
	}
	
</script>