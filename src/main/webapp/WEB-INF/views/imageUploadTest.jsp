<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 테스트</title>
</head>
<body>
	<h1>파일 업로드 예제</h1>

	<form method="post" action="upload" enctype="multipart/form-data">
		<label>email:</label> <input type="text" name="email"> <br>
		<br> <label>파일:</label> <input type="file" name="file1">
		<br>
		<br> <input type="submit" value="upload">
	</form>

</body>
</html>