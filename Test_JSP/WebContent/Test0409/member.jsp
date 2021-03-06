<%@page import="members.MemberDTO"%>
<%@page import="members.MemberDAO"%>
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
	.div_member{text-align: center; margin: 0 auto;}
	.hr_member{width: 250px;}
	#span_id{margin-left: 75px;}
	#input_member_id{margin-bottom: 5px; margin-left: 15px;}
	#input_member_pwd{margin-bottom: 5px;}
	#input_member{margin-bottom: 5px; margin-left: 31px;}
	#span_member{color: blue; font-size: 6px; margin-right: 140px;}
</style>
	
	<script>
	var idChkBtn = 0;
	function idChk() {			
		var id_Chk = document.getElementById("input_member_id").value;
		
		if(id_Chk == ""){		
			alert("아이디를 입력하세요");
			document.getElementById("input_member_id").focus();
		} else {
			location.href="idChk.jsp?id="+id_Chk;
		}		
	}
	
	function idChkRF() {		
		<%try{
			String result = request.getParameter("result");
			
			if(result.equals("t")){%>			
				document.getElementById("input_member_id").focus();
			<%}else{				
				String idP = request.getParameter("id");%>		
				idChkBtn++;
				document.getElementById("input_member_id").value="<%=idP %>";
				document.getElementById("idChkR").value="check";
				document.getElementById("input_member_pwd").focus();			
			<%}
		}catch(Exception e){}%>
	}

</script>

</head>
<body onload="idChkRF()">

	<c:import url="header.jsp"/>
	<div class="div_member">
	<h2>회원 가입</h2>
	<form action="member_Result.jsp">
		<span id="span_id">아이디: </span><input  id="input_member_id" type="text" placeholder="아이디" style="" name="id">
		<button type="button" onclick="idChk();">중복확인</button>		
		<br>
		비밀번호: <input id="input_member_pwd" type="text" placeholder="비밀번호" name="pwd"><br>
		이름: <input  id="input_member" type="text" placeholder="이름" name="name"><br>
		<hr class="hr_member">
		부서: <select name="dept" style="margin-right: 30px;">
				<option value="선택">-선택-</option><option value="영업">영업</option><option value="인사">인사</option><option value="총무">총무</option>
			</select>
		직급: <select name="rank">
				<option value="선택">-선택-</option><option value="사원">사원</option><option value="대리">대리</option><option value="차장">차장</option>
			</select><br><br>
		<span id="span_member">*모든 사항을 입력해주세요</span>
		
		<input type="hidden" value="none" id="idChkR" name="idChkR">
		
		<br><br>
		<input type="submit" value="가입">
		<button type="button" onclick="location.href='index.jsp'">취소</button>	
	</form>
	</div>
	<c:import url="footer.jsp"/>
</body>
</html>