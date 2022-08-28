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
				<div class="col-sm-2" id="replyWriteId<%=xxx.getBoardRealContentId()%>" style="height: 79px; width: 120px; text-align: center; line-height: 60px;"><%=xxx.getBoardUserId() %></div>
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
				<div class="col-sm-2" id="replyWriteId<%=yyy.getBoardRealContentId()%>" style="height: 79px; width: 120px; text-align: center; line-height: 79px;"><%=yyy.getBoardUserId() %></div>
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
			<div class="col-sm-2" id="replyWriteId<%=zzz.getBoardRealContentId()%>" style="height: 79px; width: 120px; text-align: center; line-height: 79px;"><%=zzz.getBoardUserId()%></div>
			<div class="col-sm-6" id="replyContent<%=zzz.getBoardRealContentId()%>" style="width: 640px;">
				<%if(zzz.getBoardDelDate()==null){%><%=zzz.getBoardContent()%><%}else{%> 삭제된 댓글입니다. <%}%>
			</div>
			<div class="col-sm-2" style="width: 190px; right: -10px;">
			<button class="btn btn-outline-secondary btn-sm" id="replybtn1" onclick="replyDelete(this)"
				 data-xxx="<%=zzz.getBoardRealContentId()%>">삭제</button>
				<button class="btn btn-outline-secondary btn-sm" id="replybtn2" onclick="showReplyArea(this)"
				 data-xxx="<%=zzz.getBoardRealContentId()%>" data-update="update">수정</button>
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

	
</script>