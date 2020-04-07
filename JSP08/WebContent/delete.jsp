<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>delete.jsp<br>
	
	<jsp:useBean id="dao" class="board.BoardDAO"/>
	${dao.delete(param.id) }"
	<c:redirect url = "list.jsp"/>

</body>
</html>