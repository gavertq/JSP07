<%@page import="oracle.net.aso.d"%>
<%@page import="java.util.ArrayList"%>
<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<jsp:useBean id="dao" class="members.MemberDAO"/>
<jsp:useBean id="dto" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:set var="flag" value="0"/>

<c:choose>
<c:when test="${dto.getId() == null }">
	${flag = 1 }
	<script>
	alert("아이디 입력은 필수입니다!");
	location.href='member.jsp';
	</script>
</c:when>

<c:when test="${dto.getPwd() == null }">
	${flag = 1 }
	<script>
	alert("비밀번호 입력은 필수입니다!");
	location.href='member.jsp';
	</script>
</c:when>

<c:when test="${dto.getName() == null }">
	${flag = 1 }
	<script>
	alert("이름 입력은 필수입니다!");
	location.href='member.jsp';
	</script>
</c:when>

<c:when test="${dto.getDept().equals('선택') }">
	${flag = 1 }
	<script>
	alert("부서 선택은 필수입니다!");
	location.href='member.jsp';
	</script>
</c:when>

<c:when test="${dto.getRank().equals('선택') }">
	${flag = 1 }
	<script>
	alert("직급 입력은 선택입니다!");
	location.href='member.jsp';
	</script>
</c:when>
<c:when test="${dto.getIdChkR().equals('none') }">
	${flag = 1 }
	<script>
	alert("아이디 중복을 확인해주세요");
	location.href='member.jsp';
	</script>
</c:when>
</c:choose>

<c:set var="regist_result" value="${dao.memberIn(dto) }"/>
<c:choose>
<c:when test="${flag == 0 }">
	<c:choose>
	<c:when test="${regist_result==true }">
		<script>
		alert("회원가입을 축하합니다");
		location.href='login.jsp';
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
		alert("회원가입 오류 발생!");
		location.href='member.jsp';
		</script>
	</c:otherwise>
	</c:choose>
</c:when>
</c:choose>
</body>
</html>