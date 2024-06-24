<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	public int add(int a, int b) {
		return a + b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본 구조 연습</title>
</head>
<body>
	<%
		int result = add(10, 20);
	%>
	<h3>덧셈 결과 1 : <%= result %></h3>
	<h3>덧셈 결과 2 : <% out.print(add(15, 25)); %></h3>
</body>
</html>