/**
 * 
 */
 
	window.onload = function () {
		hideAdminElelments(getIsAdmin());
		document.getElementById("searchBtn").addEventListener('mouseover', changeIcon);
		document.getElementById("searchBtn").addEventListener('mouseout', changeIcon2);
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

	function getIsAdmin() {
		if("taengoov"=="<%=userId%>"){
			return true;
		}else{
			return false;
		}
	}
	
	function searchGo() {
		document.getElementById("searchForm").submit();
	}
	function changeIcon() {
		document.getElementById("searchIcon").src="upload/search2.png"
	}
	function changeIcon2() {
		document.getElementById("searchIcon").src="upload/search.png"
	}