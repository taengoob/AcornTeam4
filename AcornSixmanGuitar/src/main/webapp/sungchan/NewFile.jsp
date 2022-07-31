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
<link rel="stylesheet"  type="text/css" href="list.css">
<style type="text/css">
   * {
       margin: 0;
       padding: 0;
       list-style: none;
       box-sizing: border-box;

   }

   a {
       color: #000;
       text-decoration: none;
   }

   .clearfix::after {
       display: block;
       content: "";
       clear: both;
   }

   .wrap {
       width: 100%;
       margin: 0 auto;
   }

   header {
       width: 100%;
       position: relative;
   }

   .logo {
       margin: 50px auto;
       text-align: center;
   }

   .logo img {
       width: 100px;
       height: 100px;
       margin: 0 auto;
   }

   nav {
       width: 100%;
       height: 50px;
       border: 1px solid #eaeaea;
       border-width: 1px 0;
       margin-top: 50px;
   }

   .navbar {
       width: 100%;

   }

   .navlayout {
       width: 90%;
       margin: 0 auto;
   }

   .navlayout div {
       float: left;
       margin-left: 30px;
   }

   .button i {
       line-height: 48px;
       padding: 0 18px;
       border-left: 1px solid #eaeaea;
       border-right: 1px solid #eaeaea;
   }

   .top-menu {
       margin: 0 auto;
   }

   .top-menu li {
       float: left;
       margin: 0 10px;
       transition: 0.1s;
   }

   .top-menu li:hover {
       border-bottom: 3px solid #333;
   }

   .top-menu li a {
       line-height: 48px;
       padding: 0 16px;
       font-size: 12px;
       color: #333;
   }

   .content {
       padding: 0;
       margin: 15px auto 0;
   }

   .goods_list_title {
       margin: 0 0 30px;
       font-size: 14px;

   }

   .title_layout {
       width: 90%;
       margin: 20px auto 0;
       border-bottom: 1px solid #eaeaea;
   }

   .title_layout h2 {
       display: inline-block;
       height: 50px;
       border-bottom: 3px solid #333;
   }

   .item_cont {
       padding: 0;
       margin: 0 5px;
       border: 1px solid #e5e5e5;
       outline: none;
       text-align: left;
       font-size: 15px;
       padding: 0 30px 30px;
   }

   .goods_list {
       width: 80%;
       margin: 0 auto;
   }

   .goods_content {
       width: 90%;
       margin: 0 auto;
   }

   .goods_list ul {
       margin-top: 150px;
   }

   .goods_list ul li {
       float: left;
       width: 25%;
       margin: 5px 0px;
   }

   .item_photo img {
       width: 100%;
      
   }

   .item_name {
       font-weight: bold;
       font-size: 15px;
       padding: 0;
       word-break: break-all;
       text-align: left;
   }

   .money_box {
       padding: 5px 0 0 0;
   }

   footer {
       height: 100px;
       width: 100%;
   }
</style>
</head>

<%
	List<ProductDTO_Temp> list = (List<ProductDTO_Temp>)request.getAttribute("products");
	String category = (String)request.getAttribute("category");
%>

<body>
    <div class="wrap clearfix">
        <section>
            <div class="content">
                <div class="goods_list">
                    <div class="goods_list_title">
                        <div class="title_layout">
                            <h2><%= category %></h2>
                        </div>
                    </div>
                </div>

                <div class="goods_content">
                    <div class="goods_list">
                        <ul class="clearfix">
                        	
                        <%
                        if (list != null)
                        	for (int i = 0; i < list.size(); i++)
                        	{
                        		ProductDTO_Temp product = list.get(i);
                        		String productImage = product.getPreviewUrl();
                        		String productName = product.getProductName();
                        		int productPrice = product.getProductPrice();
                        %>
                        	<li>
                                <div class="item_cont">
                                    <div class="item_photo"><a href="#"><img src="<%= productImage %>" alt="photo"></a>
                                    </div>
                                    <div class="item_info">
                                        <div class="name_box"><a href="#"><strong class="item_name">
                                        <%= productName %></strong></a></div>
                                        <div class="money_box"><strong><%= productPrice %></strong></div>
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