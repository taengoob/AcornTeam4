<%@page import="com.dto.ProductDTO_Temp"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Document</title>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link href="product/product.css" rel="stylesheet" type="text/css" >

	</head>
	
	<%
	List<ProductDTO_Temp> list = (List<ProductDTO_Temp>)request.getAttribute("list");
	String category = (String)request.getAttribute("category");
	%>
	
	<body>
	    <div class="wrap clearfix">
	        <section>
	            <div class="content">
	                <div class="goods_content">
	                    <div class="goods_list">
<!-- 	                        <ul class="clearfix"> -->
	                        <ul>
	                        	
	                        <%
	                        if (list != null)
	                        	for (int i = 0; i < list.size(); i++)
	                        	{
	                        		ProductDTO_Temp product = list.get(i);
	                        		String productId = product.getProductId();
	                        		String productImage = product.getPreviewUrl();
	                        		String productName = product.getProductName();
	                        		String productCont = product.getProductContent();
	                        		int productPrice = product.getProductPrice();
	                        %>
	                        	<li>
	                                <div class="item_cont">
	                                    <div class="item_photo" >
	                                    	<a href="ProductDetailServlet?productId=<%=productId%>">
                                    			<img src="<%=productImage%>" alt="photo">
	                                    	</a>
	                                    </div>
	                                    <div class="item_info" >
	                                        <div class="name_box">
	                                        	<a href="ProductDetailServlet?productId=<%=productId%>">
	                                        		<b class="item_name"><%=productName%></b>
	                                        	</a>
	                                        </div>
	                                        <div class="cont_box"><%=productCont%></div>
	                                        <div class="money_box"><b>판매가 : <%= productPrice %>원</b></div>
	                                    </div>
	                                </div>
	                            </li>
	                        <%
	                        	}
	                        %>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </section>
	        <footer>
	        </footer>
	    </div>
	</body>
</html>