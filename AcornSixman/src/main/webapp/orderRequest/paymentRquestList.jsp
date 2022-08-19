<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- Bootstrap CSS -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous"
		/>

		<script type="text/javascript"></script>

		<title>결제시스템</title>
	</head>
	<body>
		<!-- 컨텐츠 작성 -->
		<hr size="0" />
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="container">
					<div>
						<header><strong>입금 대기</strong></header>
						<hr />
					</div>
					<table class="table table-hover align-middle" style="text-align: center">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Request ID</th>
								<th scope="col">Order ID</th>
								<th scope="col">Product Name</th>
								<th scope="col">User ID</th>
								<th scope="col">Request Date</th>
								<th scope="col">Update Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>PMOD22080202170400049</td>
								<td>OD22080202170400049</td>
								<td>Taylor 어쿠스틱기타 GS Mini</td>
								<td>dg38</td>
								<td>2022-08-02 14:17:04</td>
								<td>2022-08-02 14:17:04</td>
								<td><button type="button" class="btn btn-primary">결제완료</button></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>PMOD22080202170400049</td>
								<td>OD22080202170400049</td>
								<td>Taylor 어쿠스틱기타 GS Mini</td>
								<td>dg38</td>
								<td>2022-08-02 14:17:04</td>
								<td>2022-08-02 14:17:04</td>
								<td><button type="button" class="btn btn-primary">결제완료</button></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>PMOD22080202170400049</td>
								<td>OD22080202170400049</td>
								<td>Taylor 어쿠스틱기타 GS Mini</td>
								<td>dg38</td>
								<td>2022-08-02 14:17:04</td>
								<td>2022-08-02 14:17:04</td>
								<td><button type="button" class="btn btn-primary">결제완료</button></td>
							</tr>
						</tbody>
					</table>

					<div style="height: 100px"></div>

					<div>
						<header><strong>결제 완료</strong></header>
						<hr />
					</div>
					<table class="table table-hover align-middle" style="text-align: center">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Reqeust ID</th>
								<th scope="col">Order ID</th>
								<th scope="col">Product Name</th>
								<th scope="col">User ID</th>
								<th scope="col">Rquest Date</th>
								<th scope="col">Update Date</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>PMOD22080202170400049</td>
								<td>OD22080202170400049</td>
								<td>Taylor 어쿠스틱기타 GS Mini</td>
								<td>dg38</td>
								<td>2022-08-02 14:17:04</td>
								<td>2022-08-02 14:17:04</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>PMOD22080202170400049</td>
								<td>OD22080202170400049</td>
								<td>Taylor 어쿠스틱기타 GS Mini</td>
								<td>dg38</td>
								<td>2022-08-02 14:17:04</td>
								<td>2022-08-02 14:17:04</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>PMOD22080202170400049</td>
								<td>OD22080202170400049</td>
								<td>Taylor 어쿠스틱기타 GS Mini</td>
								<td>dg38</td>
								<td>2022-08-02 14:17:04</td>
								<td>2022-08-02 14:17:04</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 컨텐츠 작성 -->
		<!-- Optional JavaScript; choose one of the two! -->
		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"
		></script>
		<!-- Option 2: Separate Popper and Bootstrap JS -->
		<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    --></body>
</html>

