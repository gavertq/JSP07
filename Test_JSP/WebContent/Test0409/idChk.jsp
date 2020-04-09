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
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<c:set var="id_Chk" value="${param.id }"></c:set>
	<c:choose>
	<c:when test="${dao.idChk(id_Chk) == true}">
		<script type="text/javascript">
		alert("중복되는 아이디 입니다");
		location.href="member.jsp?result=t";		
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		alert("사용가능한 아이디 입니다");
		location.href="member.jsp?result=f&id=${id_Chk}";	
		</script>
	</c:otherwise>
	</c:choose>
</body>
</html>