<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = "yeeun";
	String userPwd = "1234";

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if (userId.equals(id) && userPwd.equals(password)) {
		response.sendRedirect("welcomePage.jsp?id=" +userId); // ? 어쩌구 = get 방식으로 보냄
	} else {
		response.sendRedirect("loginPage.jsp?error=1");
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>

</body>
</html>