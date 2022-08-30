/**
 * 
 */
 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",//textarea ID 입력
	 sSkinURI: "smarteditor2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});

	window.onload = function () {
		hideAdminElelments(getIsAdmin());
	};
	
	function hideAdminElelments(isAdmin) {
		if (isAdmin === false) {
			//class 에 admin이 있는 요소들을 찾는다.
			const elements = document.getElementsByClassName("admin");
	
			//class 에 admin이 있는 요소들을 순회하면서
			for (const key in elements) {
				if (Object.hasOwnProperty.call(elements, key)) {
					const element = elements[key];
					//안보이게 만든다.
					element.style.display = "none";
				}
			}
		}
	}

	function getIsAdmin() {//세션에서 받아온 로그인중인 ID가 taengoov 일 경우 관리자로 인식
		if("taengoov"=="<%=userId%>"){
			return true;
		}else{
			return false;
		}
	}

	function writeChk(event) {
		//스마트 에디터를 사용할 textarea의 ID 입력
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

        //버튼 클릭시 유효성 검사(제목/내용 미입력 및 카테고리 셀렉트 안할시)
        var category = document.getElementById("Category").value;
        var subcategory = document.getElementById("subCategory").value;
		var title = document.getElementById("title").value;
		var content = document.getElementById("content").value;
		console.log(category+" "+title+" "+content+" "+subcategory);
		if(category.length==0||title.length==0||content.length==0||subcategory.length==0){
			event.preventDefault();
			alert("작성되지 않은 칸이 있습니다.");
		}else{
			try {//유효성 검사가 끝난 후 서브밋 진행
				document.getElementById("writeForm").submit();
			} catch(e) {}
		}
	}

	 function getContextPath() {

		    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

	 }

	 function changeCategory() {
		 var NOTICE = ["공지사항","이벤트"];
         var NEWS = ["공지사항",'기타소식','할인소식','공연소식'];
         var BOARD = ["공지사항",'잡담','질문','정보'];
         var SECONDHAND = ["공지사항",'삽니다','팝니다'];
         var QnA = ["공지사항",'질문','답변'];
         var Category = document.getElementById("Category").value;
         var Option;
         if(Category == 'NOTICE'){
        	Option = NOTICE;
         }else if(Category == 'NEWS'){
        	Option = NEWS;
         }else if(Category == 'BOARD'){
         	Option = BOARD;
         }else if(Category == 'SECONDHAND'){
         	Option = SECONDHAND;
         }else{
        	Option = QnA;
         }
         document.getElementById("subCategory").innerHTML = "";
         if("taengoov"=="<%=userId%>"){//관리자 전용 메뉴 
          	$("#subCategory").append('<option class="n admin">'+Option[0]+'</option>');
         }
         $("#subCategory").append('<option disabled selected>글유형 선택</option>');
         for (var i=1; i<Option.length; i++) {
        	$("#subCategory").append('<option>'+Option[i]+'</option>');
         }
	}