<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#td_right{text-align: right;}
#td_center{text-align: center;}
</style>

</head>
<body>list.jsp<br>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="dao" class="board.BoardDAO"/>
<div align="center">
	<table border="1">
		<caption><font size="6"><b>게 시 판</b></font></caption>
		<tr>
			<th>번호</th><th>이름</th><th>제목</th><th>날짜</th>
			<th>조회수</th><th>group</th><th>step</th><th>indent</th>
		</tr>
		<c:forEach var="dto" items="${dao.list() }">
		<tr>
			<td id="td_center">${dto.id }</td><td id="td_center">${dto.name }</td>
			<td id="td_right"><a href="content_view.jsp?id=${dto.id }">${dto.title }</a></td>
			<td>${dto.savedate }</td>
			<td id="td_right">${dto.hit }</td><td id="td_right">${dto.idgroup }</td>
			<td id="td_right">${dto.step }</td><td id="td_right">${dto.indent }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="8"><a href="write_view.jsp">글작성</a></td>
		</tr>
	</table>
</div>

</body>
</html>