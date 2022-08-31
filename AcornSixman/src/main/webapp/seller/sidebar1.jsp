<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="style.css">
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"> 
      <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
      <style type="text/css">
      *{
  padding: 0;
  margin: 0;
  text-decoration: none;
  list-style: none;
  box-sizing: border-box;

}
html{
  
  scroll-behavior: smooth;
}
body{

  font-family: montserrat;
}
ul{
  position: fixed;
  top: 0;
  left: 0;
  margin-left: -240px;
  width: 240px;
  background: #1e1e1e;
  height: 100vh;
  overflow-y: auto;
  transition: all .3s;
}
ul li{
  height: 65px;
  outline: none;
}
ul li a{
 visibility: visible;	 
   display: block;  
  height: 100%;
  width: 100%;
  line-height: 70px;
  font-size: 20px;
  color: white;
  padding-left: 10%;
  background: #1e1e1e;
  border-top: 1px solid rgba(255,255,255,.1);
  border-bottom: 1px solid black;
  border-left: 5px solid transparent;
}
li a.contact{
  border-bottom: 1px solid rgba(0,0,0,.5);
}
.active a{
  color: #B93632; 
  border-left: 5px solid #B93632;
  background: #1B1B1B;
}
section{
  margin-left: 0px;
  transition: all .3s;
}
i{
  position: absolute;
  top :0px;
  left : 0px;
  margin: 20px 25px;
  font-size: 40px;
  color: orangered;
  cursor: pointer;
}

h2{
  font-size: 40px;
  padding: 15px 20px;
}
p{
  padding: 0 20px 10px 20px;
  text-align: justify;
}
.ul_show{
  margin-left: 0px;
}
.slide_image{
  margin-left: 260px;
}
</style>
</head>
 <body>
      <ul>
         <li><a href="ProductUploadFormServlet">제품 등록</a></li>
         <li><a href="ProductAddServlet">제품 등록(수정중)</a></li>
         <li><a href="ProductListServlet1">상품 목록</a></li>
         <li><a href="ProcessListServlet">주문처리현황</a></li>
      </ul>
       
         <i class="fas fa-bars"></i>
       
    <script>
         $(document).ready(function(){
            $('i').click(function(){
             $('ul').toggleClass('ul_show');
           }); 
           $('li').click(function(){
             $(this).addClass('active').siblings().removeClass('active');
           });
         });
         
      </script>
   </body>
</html>