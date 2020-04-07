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
<body>content_view.jsp<br>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="board.BoardDAO"/>
	<c:set var="dto" value="${dao.contentView(param.id) }"/>

	<div align="center">
		<form action="modify.jsp" method="post">
			<input type="hidden" name="id" value="${dto.id }">
			<table border="1">
			<tr>
				<th>번호</th><td>${dto.id }</td>
			</tr>
			<tr>
				<th>조회수</th><td>${dto.hit }</td>
			</tr>
			<tr>
				<th>이름</th><td><input type="text" value="${dto.name }" name="name"></td>
			</tr>
			<tr>
				<th>제목</th><td><input type="text" value="${dto.title }" name="title"></td>
			</tr>
			<tr>
				<th>내용</th><td><textarea name="content" rows="10" cols="50">${dto.content }</textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
				<a href="list.jsp">목록이동</a>&nbsp;&nbsp;
				<a href="">삭제</a>&nbsp;&nbsp;
				<a href="">답변</a>
				</th>
			</tr>	
			</table>
		</form>
	</div>

</body>
</html>