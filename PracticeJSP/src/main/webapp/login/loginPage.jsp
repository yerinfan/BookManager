<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<h1>로그인</h1>
	<%
		String error = request.getParameter("error");
		if (error != null && error.equals("1")) {
	%>
		<p>로그인을 다시 하세요. </p>
	<%
		} 
	%>	
	<form action="login.jsp" method="post">
		<input type="text" name="id" placeholder="아이디 입력"><br>
		<input type="text" name="password" placeholder="비밀번호 입력"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>