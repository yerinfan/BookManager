<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.Arrays"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String course = request.getParameter("course");
	String[] favArr = request.getParameterValues("favorite");
	String favorite = Arrays.toString(favArr);
	String intro = request.getParameter("intro").replace("\r\n","<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Request Parameter 읽기 결과</title>
</head>
<body>
	<ul>
		<li>아이디 : <%=id %></li>
		<li>과정 : <%=course %></li>
		<li>관심사항 : <%=favorite %></li>
		<li>자기소개 : <br> <%=intro %></li>
	</ul>
</body>
</html>