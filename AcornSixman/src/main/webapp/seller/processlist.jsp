<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<style>
/* Google Web Font */
@import url('https://fonts.googleapis.com/css?family=Montserrat:300,400,500&display=swap');
* {
    box-sizing: border-box;
}
body {
    font-family: 'Montserrat', sans-serif;
    margin: 0;
    color: #333;
    font-size: 15px;
    line-height: 1.6em;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
/* Table */
.member {
    width: 900px;
    background-color: #fff;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
    border-radius: 5px;
    overflow: hidden;
}
.member tr {
    border-bottom: 1px solid #eee;
}
.member tr:last-child {
    border: none;
}
.member tr:nth-child(odd) {
    background-color: #ddd;
}
.member th,
.member tr td:first-child {
    color: crimson;
    font-weight: 500;
}
.member td {
	
    padding: 12px;
    text-align: center; 
}
.member tr th {
    background-color: royalblue;
    color: #fff;
}
.member tr th:first-child {
	
    border-radius: 5px 0 0 0;
}
.member tr th:last-child {
    border-radius: 0 5px 0 0;
}
.member tr td:last-child {
}
</style>

<body>
    <table class="member">
        <tr>
            <th>처리현황</th>
            <th>주문자</th>
            <th>상품명</th>
            <th>수량</th>
            <th>배송지</th>
            <th>고객 전화번호</th>
            <th>주문일</th>
        </tr>
        <tr>
            <td>미처리</td>
            <td>JONES</td>
            <td>MANAGER</td>
            <td>1981-04-02</td>
            <td>2000</td>
            <td>010-0000-0000</td>
            <td>2022-08-16</td>
        </tr>
        <tr>
            <td>7788</td>
            <td>SCOTT</td>
            <td>ANALYST</td>
            <td>1987-04-19</td>
            <td>3000</td>
             <td>010-0000-0000</td>
            <td>2022-08-16</td>
        </tr>
        <tr>
            <td>7844</td>
            <td>TURNER</td>
            <td>SALESMAN</td>
            <td>1981-09-08</td>
            <td>1500</td>
             <td>010-0000-0000</td>
            <td>2022-08-16</td>
        </tr>
        <tr>
            <td>7876</td>
            <td>ADAMS</td>
            <td>CLERK</td>
            <td>1987-05-23</td>
            <td>1000</td>
             <td>010-0000-0000</td>
            <td>2022-08-16</td>
        </tr>
        <tr>
            <td>7369</td>
            <td>SMITH</td>
            <td>CLERK</td>
            <td>1980-12-17</td>
            <td>800</td>
             <td>010-0000-0000</td>
            <td>2022-08-16</td>
        </tr>
        <tr>
            <td>7839</td>
            <td>KING</td>
            <td>PRESIDENT</td>
            <td>1981-11-17</td>
            <td>5000</td>
             <td>010-0000-0000</td>
            <td>2022-08-16</td>
        </tr>
    </table>
</body>
</html>
