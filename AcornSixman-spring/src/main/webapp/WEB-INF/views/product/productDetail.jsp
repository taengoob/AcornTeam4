<%@page import="com.acorn.sixman.dto.MemberDTO"%>
<%@page import="com.acorn.sixman.dto.ImageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.acorn.sixman.dto.ProductDTO_Temp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    	<link rel="stylesheet" href="static/css/productview.css">
	</head>
	
	<%
	
	
	List<ImageDTO> images = (List<ImageDTO>)request.getAttribute("images");
	
	ProductDTO_Temp product = (ProductDTO_Temp)request.getAttribute("product");
	String previewImage = product.getPreviewUrl();
	String productId = product.getProductId();
	String productName = product.getProductName();
	String productModel = product.getProductModel();
	String productContent = product.getProductContent();
	String maker = product.getProductMaker();
	String madeIn = product.getProductMadein();
	String sellerId = product.getProductSeller();
	
	int productPrice = product.getProductPrice();
	int deliveryPrice = product.getProductDeliveryPrice();
	int stock = product.getProductStock();
	
	%>
	
	<script type="text/javascript">
		window.onload = function() {
// 			제품 수량 변경시 가격 반영 이벤트
			document.getElementById("productQty").onchange = onQtyChanged;
			
// 			작은 이미지 클릭 이벤트
			const images = document.getElementsByClassName('img_sm');
			for (var i = 0; i < images.length; i++) {
				images[i].onclick = onImageClicked;
			}
			
			document.getElementById("orderAddBtn").onclick = onOrderAddBtnClicked;
			document.getElementById("cartAddBtn").onclick = onCartAddBtnClicked;
			
		}
		
		let qty = 1;
		function onQtyChanged() {
			qty = this.value;
			const price = <%= productPrice %> * qty;
			const totalPrice = price + <%= deliveryPrice %>;
// 			console.log("totalPrice :", totalPrice);
			document.getElementById("productPrice").innerHTML = price;
			document.getElementById("orderPrice").innerHTML = totalPrice + "원";
			document.getElementById("hiddenTotalPrice").value = totalPrice;
		}
		
		function onImageClicked() {
			console.log(this);
			const clickedSrc = this.src;
			document.getElementById("view").src = clickedSrc;
			
			const images = document.getElementsByClassName('img_sm');
			for (var i = 0; i < images.length; i++) {
				images[i].style.opacity = images[i] === this ? "1" : "0.3";
			}
			
		}
		
		function onOrderAddBtnClicked() {
			
			const productId = "<%= productId %>";
			const order = {
				cartId : ""
				,productId : productId
				,amount : parseInt(qty)
			}
			
			const orderList = [];
			orderList.push(order);
			
// 			//테스트 코드
// 			const testOrder = {
// 				cartId : "detail"
// 				,productId : "PD22072912101400005"
// 				,amount : 2
// 			}
// 			orderList.push(testOrder);
// 			//테스트 코드
			
			const orderListJsonStr = JSON.stringify(orderList);
			
			document.getElementById("hiddenInput").value = orderListJsonStr;
			const btnForm = document.getElementById("btnForm");
			btnForm.action = "addOrderForm";
			btnForm.submit();
			
// 			console.log(orderList);
// 			console.log(JSON.stringify(order));
// 			console.log(JSON.stringify(orderList));
		}
		
		function onCartAddBtnClicked() {
			
			const productId = "<%= productId %>";
			const url = "cartAdd?"
						+"productId=" + productId
						+"&&cartCount=" + qty;
			console.log(url);

			fetch(url);

			location.href = "productDetail?productId=" + productId;
		}
			
			//view의 src 변경
	</script>
	
	<body style="width: 100%; margin: 0 auto;">
	    <div class="wrap clearfix">
	        <section>
	            <div class="content">
	                <div class="content_layout clearfix">
	                    <div class="item_photo">
	                        <div class="photo_big">
	                            <img src="<%= previewImage %>" id="view" alt="photo">
	                        </div>
	                        <div class="photo_list">
	                            <ul class="clearfix">
	                            <% 
	                            for(ImageDTO image : images) {
	                            	double opacity = images.indexOf(image) == 0 ? 1 : 0.3;
	                            %>
	                            	<li class="photo_list_sm">
	                            		<a href="#"><img class="img_sm" src="<%= image.getImage_url() %>" style="opacity: <%= opacity %>;" alt="photo"></a>
	                            	</li>
	                            <%
	                            }
	                            %>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="item_info">
	                        <div class="info_box">
	                            <div class="info_title">
	                                <h3><strong><%= productName %></strong></h3>
	                            </div>
	                            <div class="info_content">
	                                <h4><strong><%= productContent %></strong></h4>
	                            </div>
	                            <div class="item_detail_list">
	                                <dl class="item_price">
	                                    <dt>판매가</dt>
	                                    <dd>
	                                        <strong><strong><%= productPrice %></strong></strong>원
	                                    </dd>
	                                </dl>
	                                <dl>
	                                    <dt>배송비</dt>
	                                    <dd>
	                                        <%= deliveryPrice %> / 주문시결제(선결제)
	                                    </dd>
	                                </dl>
	                                <dl>
	                                    <dt>상품코드</dt>
	                                    <dd><%= productId %></dd>
	                                </dl>
	                                <dl>
	                                    <dt>모델명</dt>
	                                    <dd><%= productModel %></dd>
	                                </dl>
	                                <dl>
	                                    <dt>제조사</dt>
	                                    <dd><%= maker %></dd>
	                                </dl>
	                                <dl>
	                                    <dt>원산지</dt>
	                                    <dd><%= madeIn %></dd>
	                                </dl>
	                                <dl>
	                                    <dt>상품재고</dt>
	                                    <dd><%= stock %>개</dd>
	                                </dl>
	                            </div>
	
	                            <table class="item_select">
	                                <tr>
	                                    <td class="item_name">
	                                        <strong><%= productName %></strong>
	                                    </td>
	                                    <td class="clearfix select_box">
	                                        <span class="button_box">
	                                            <span class="goods-qty">
	                                                <input type="number" min="1" value="1" class="num" id="productQty" >
	                                            </span>
	                                        </span>
	                                    </td>
	                                    <td id="productPrice"><%= productPrice %></td>
	                                </tr>
	                                <tr>
	                                    <td class="item_name">
	                                        <strong>배송비</strong>
	                                    </td>
	                                    <td class="clearfix select_box">
	                                        <span class="button_box">
	                                            <span class="goods-qty">
	                                                
	                                            </span>
	                                        </span>
	                                    </td>
	                                    <td><%= deliveryPrice %></td>
	                                </tr>
	                            </table>
	                            <div class="item_pay item_total">
	                                <dl class="clearfix">
	                                    <dt>총 합계금액</dt>
	                                    <dd id ="orderPrice"><%= productPrice + deliveryPrice %>원</dd>
	                                </dl>
	
	                            </div>
	                            <div class="btn_choice_box">
	                                <div>
	                                	<form id="btnForm" action="#" method="get">
	                                		<input id="hiddenTotalPrice" name="totalPrice" value="<%= productPrice + deliveryPrice %>" type="hidden">
	                                		<input id="hiddenInput" name="jsonStr" value="" type="hidden">
		                                	<input id="cartAddBtn" type="button" class="btn_add_cart" value="장바구니">
		                                    <input id="orderAddBtn" type="button" class="btn_add_order" value="바로구매">
	                                	</form>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
	        <hr>
	        <br>
	        <br>
	        <br>
	<center><img src="static/img/<%= productId %>.jpg"></center>
	        
	        <footer>
	        </footer>
	    </div>
	</body>
</html>