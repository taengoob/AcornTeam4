<%@page import="com.dto.ImageDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.ProductDTO_Temp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    	<link rel="stylesheet" href="product/productview.css">
		
	</head>
	
	<%
	List<ImageDTO> images = (List<ImageDTO>)request.getAttribute("images");
	
	ProductDTO_Temp product = (ProductDTO_Temp)request.getAttribute("product");
	String previewImage = product.getPreviewUrl();
	String productId = product.getProductId();
	String productName = product.getProductName();
	String productModel = product.getProductModel();
	String maker = product.getProductMaker();
	String madeIn = product.getProductMadein();
	
	int productPrice = product.getProductPrice();
	int deliveryPrice = product.getProductDeliveryPrice();
	int stock = product.getProductStock();
	
	String test = images.get(1).getImage_url();
	%>
	
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById("productQty").onchange = onQtyChanged;
			const images = document.getElementsByClassName('img_sm');
			for (var i = 0; i < images.length; i++) {
				images[i].onclick = onImageClicked;
			}
		}
		
		function onQtyChanged() {
			const qty = this.value;
			const price = <%= productPrice %> * qty;
			const totalPrice = price + <%= deliveryPrice %>;
			document.getElementById("productPrice").innerHTML = price;
			document.getElementById("orderPrice").innerHTML = totalPrice;
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
			
			//view의 src 변경
	</script>
	
	<body>
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
	                                    <dt>브랜드</dt>
	                                    <dd><%= maker %></dd>
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
	                                    <!-- N:재입고 알림이 있을 때는 restock 클래스를 div에 같이 넣어주세요 -->
	                                    <button id="cartBtn" type="button" class="btn_add_cart">장바구니</button>
	                                    <button type="button" class="btn_add_order">바로 구매</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
	        <footer>
	        </footer>
	    </div>
	</body>
</html>