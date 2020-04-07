<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><h3>fileFormOk.jsp</h3><br>
<%
    String path = request.getRealPath("fileUpDown");	//실질적으로는 request가 아니라 application으로 실제 경로를 가져와야한다
    out.print("fileFolder path : "+path);
    int size = 1024 * 1024 * 10; //10MB.. 용량 사이즈(1024kb가 1024개 있으면 1mb. 1mb 10개면 10mb)
    String file = "";	String oriFile = "";

    MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
    file = multi.getFilesystemName("file");
    oriFile = multi.getOriginalFileName("file");
    out.print("<br>DefaultFileRenamePolicy() : 동일한 이름의 파일이 존재 한다면 1,2,3을 넣어 주겠다");
    out.print("<br>file(저장될 파일 이름) : " + file);
    out.print("<br>oriFile(실제 파일 이름) : " + oriFile);   
%>
	<hr>
	test: <%=multi.getParameter("test") %><br>	<%--결과 잘 들어옴. Form의 enctype="multipart/form-data로 만들었기 때문 --%>
	test: <%=request.getParameter("test") %><br> <%--결과는 null. multi라서 이건 작동 x--%>
	

</body>
</html>
