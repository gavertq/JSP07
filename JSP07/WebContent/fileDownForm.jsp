<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><h3>fileDownForm.jsp</h3><br>
<%
	String saveDir = application.getRealPath("fileUpDown"); //fileUpDown 폴더의 실제 경로 저장
	File dir = new File(saveDir);
	String fName[] = dir.list();
	for(String fileName : fName){//파일에 있는 file들 목록을 보여줌
		String en = URLEncoder.encode(fileName, "UTF-8");	//인코딩. 한글 깨짐, 오류 방지
		out.write("<a href=http://localhost:8085/"+request.getContextPath()
						+"/FileDown?fileName="+en+">"+fileName+"</a><br>");
	}
%>

</body>
</html>