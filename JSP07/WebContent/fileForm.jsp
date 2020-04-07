<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="fileFormOk.jsp" method="post" enctype="multipart/form-data">
		파일: <input type="file" name="file"><br>
		<input type="text" name="test" value="연습중"><br>
		<input type="submit" value="file upload">
	</form>
</body>
</html>