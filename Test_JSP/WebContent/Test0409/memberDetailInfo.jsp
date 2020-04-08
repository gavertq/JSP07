<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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

<style type="text/css">
.div_memberDetail{text-align: center;  margin-top: 30px;}
table{margin: 0 auto;}
table th{text-align: right; width: 70px;}
table td{width: 50px;}
</style>

</head>
<body>

<c:set var="id" value="${param.id}"/>
<c:set var="UserId" value="${sessionScope.UserId }"/>

<c:import url="header.jsp"/>
	<c:choose>	<%--첫번째 조건문 로그인 한 후면 --%>
	
		<c:when test="${ sessionScope.loginSuccess == 'Yes'}">
		<c:choose>	<%--두번째 조건문 유저와 보려는 정보의 id가 같다면 --%>
			<c:when test="${id==UserId }">
				<jsp:useBean id="dao" class="members.MemberDAO"/>
				<jsp:useBean id="dto" class="members.MemberDTO"/>
							
				<c:set var="list" value="${dao.memberDetailView(id) }"/>
		
				<c:choose>
					
					<c:when test="${list.size() != 0 }">
							<div class="div_memberDetail">
							<c:forEach var="m" items="${list }">
							<h2>${m.name }님의 개인 정보</h2>
							<table>								
								<tr><th>아이디: </th><td>${m.id }</td></tr>
								<tr><th>비밀번호: </th><td>${m.pwd }</td></tr>
								<tr><th>이 름: </th><td>${m.name }</td></tr>
								<tr><th>부 서: </th><td>${m.dept }</td></tr>
								<tr><th>직 급: </th><td>${m.rank }</td></tr>							
							</table>
							</c:forEach>
							<br>
							<input type="button" value="돌아가기"  onclick="javascript:history.back();">
						
						</div>
		
					</c:when>
						
					<c:otherwise>
						<div class="div_memberDetail">
							<h3>데이터 없음</h3>
						</div>
					</c:otherwise>
				</c:choose>
				</c:when>
			<c:otherwise> <%--두번째 조건문 유저와 보려는 id정보가 다르다면 --%>
				<c:redirect url="memberInfo.jsp"/>
			</c:otherwise>
		</c:choose>
		</c:when>
		
		<c:otherwise> <%--첫번째 조건문 로그인 하지 않았다면 --%>
			<script type="text/javascript">location.href="login.jsp"</script>
		</c:otherwise>	
	</c:choose>
<c:import url="footer.jsp"/>

</body>
</html>