<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>write_view.jsp<br>
<fmt:requestEncoding value="utf-8"/>

<div align="center">
	<form action="write_save.jsp">
	<table border="1">
		<tr>
			<th>이름</th><td><input type="text" name="name" size="50"></td>
		</tr>
		<tr>
			<th>제목</th><td><input type="text" name="title" size="50"></td>
		</tr>
		<tr>
			<th>내용</th><td><textarea name="content" rows="10" cols="80"></textarea></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="저장">&nbsp;&nbsp;&nbsp;<a href="list.jsp">목록 이동</a></th>
		</tr>
	</table>
</form>
</div>

</body>
</html>