<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 
	<%
	if (id != null) {
		out.print(id +"님,");
	}
	%> 로그인 성공 <br> ***환영합니다***</h1>
</body>
</html>