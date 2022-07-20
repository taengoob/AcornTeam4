<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지업로드</title>
</head>
<body>
	<form action="ImageUploadServlet" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="title" value=""></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td colspan="3">
					<input type="file" name="f" multiple>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea cols="80" rows="20" name="content"></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="저장">
		    <a href="ImageListServlet">취소</a>
		</div>
	</form>
</body>
</html>