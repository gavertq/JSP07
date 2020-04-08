<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#div_header{text-align: center; width: 80%; margin-left: 10%;}
header{color: gold; margin: 0 auto; font-family: Gabriola; font-size: 60px; font-weight: bold; height: 130px;}
nav{background-color: #20B2AA; height: 55px;}
ul{list-style: none;}
ul li{display:inline; margin-right:60px; margin-bottom: 10px;}
#a_header{text-decoration: none; color: white; font-weight: bold; font-size: 18px;}
</style>

</head>
<body>

<div id="div_header">
	<header><img alt="CARE LAB" src="../images/header_img.PNG"></header>
		<nav>
		<hr>
			<ul>
				<li><a id="a_header" href="index.jsp">Home</a>
				</li><li><a id="a_header" href="memberInfo.jsp">회원 정보</a></li>
				
				<c:choose>		
					<c:when test="${sessionScope.loginSuccess == 'Yes' }">
					<li><a id="a_header" href="logout.jsp">로그아웃</a></li>
					</c:when>
					<c:otherwise>
					<li><a id="a_header" href="login.jsp">로그인</a></li>
					</c:otherwise>
				</c:choose>	
			
			</ul>
		
		</nav>	
</div>

</body>
</html>