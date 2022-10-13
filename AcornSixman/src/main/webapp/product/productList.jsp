<%@page import="com.dto.ProductDTO_Temp"%>
<%@page import="java.util.List"%>
<%@page buffer="8192kb" autoFlush="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<ProductDTO_Temp> list = (List<ProductDTO_Temp>)request.getAttribute("list");
String category = (String)request.getAttribute("category");
%>


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

