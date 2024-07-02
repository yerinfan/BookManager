<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

</head>
<body>
<%@ include file="/common/header.jsp" %>
	<h1>로그인</h1>
	<%
	if (request.getParameter("loginError") != null) {
	%>
		<p>로그인을 다시 하세요. </p>
	<%
		} 
	%>	
	<form action="signIn.jsp" method="post">
		<input type="text" name="id" placeholder="아이디 입력"><br>
		<input type="text" name="password" placeholder="비밀번호 입력"><br>
		<input type="submit" value="로그인">
	</form>
	<%@ include file="/common/footer.jsp" %>
</body>
</html>