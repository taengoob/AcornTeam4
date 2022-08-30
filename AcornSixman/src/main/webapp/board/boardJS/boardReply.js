/**
 * 
 */
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
		var ContentId = $(e).attr("data-xxx");
		if(ContentId=='undefined'||ContentId==null){ContentId = $("#RealContentId").val();}
		var width1 = $(e).attr("data-width1");
		var width2 = $(e).attr("data-width2");
		console.log("게시글아이디: "+ContentId+"너비: "+width1, width2);
		var UserId = $("#replyUserId").text();
		var ReplyContent = $("#replyarea"+ContentId).val();
		if(!ReplyContent){ReplyContent=$("#replyarea").val();}
		console.log("아이디: "+UserId+"아이디의 길이:"+UserId.length);
		if(UserId!="로그인이 필요합니다."){
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
					 + '<span style="float: right;"><br>'+ele.boardRegDate+'</span></div>'	
					 + '</div><div style="height: 20px; width: 100%; margin: auto;"></div>'	
					 + '<div id="reply'+ele.boardRealContentId+'"></div>';
			}else{ 
				html += '<span style="float: right;"><br>'+ele.boardRegDate+'</span></div>'	
				     + '</div><div style="height: 20px; width: 100%; margin: auto;"></div>'
					 + '</div><div id="reply'+ele.boardRealContentId+'"></div>';	
			}	
		})
		console.log("다음 아이디"+replyNextId);
		console.log("값 검정"+$("#reply"+ContentId).val());
		if($("#reply"+ContentId).css('display') === 'block'){//대댓글인 경우
			if(replyNextId==" "){//해당 댓글에 다른 대댓글이 없을경우
				$("#reply"+ContentId).append(html);//해당 댓글 아래에 대댓글 추가
			}else{//해당 댓글에 다른 대댓글이 있을경우
				$("#reply"+replyNextId).append(html);//다른 대댓글들중 가장 나중에 작성한 댓글 아래에 추가
			}
			$("#replyarea"+ContentId).val("");//텍스트 입력창 비우고
			$("#replybox"+ContentId).css('display', "none");//텍스트 입력창 숨김
		}else{//대댓글이 아닌경우
			if(replyNextId==" "){//해당 게시들에 다른 댓글이 없을경우
				$("#replybody").append(html);//첫 댓글 추가
			}else{//해당 게시물에 다른 댓글이 있을경우
				$("#reply"+replyNextId).append(html);//가장 나중에 작성한 댓글 아래에 추가
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