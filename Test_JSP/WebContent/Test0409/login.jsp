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
	.div_login{margin: 0 auto; width: 80%; text-align: center; margin-top: 30px;}
	.table_login{margin: 0 auto;}
	.a_Login{color:gray; text-decoration:none; margin-left: 50px;}
</style>

</head>
<body>

<c:import url="header.jsp"/>

<div class="div_login">
	<h3>로그인 페이지 입니다</h3>
		<form action="loginChk.jsp" method="post">
		<table class="table_login">
			<tr>
				<td><input type="text" name="idLogin" placeholder="아이디"><br></td>
				<td rowspan="2"><input type="submit" value="로그인" style="padding: 13px 2px;"></td>
			</tr>
			
			<tr>
				<td><input type="text" name="pwdLogin" placeholder="비밀번호"><br></td>
			</tr>
		</table>					
			<a class="a_Login" href="member.jsp">회원 가입</a>
		</form>
</div>

<c:import url="footer.jsp"/>

</body>
</html>