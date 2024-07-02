<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/isLoggedIn.jsp" %> 
    
<%
	String noStr = request.getParameter("no");
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		MemberService service = new OracleMemberService(new MemberDAO());
		Member member = service.read(Integer.parseInt(noStr));
		if (member == null) {
			response.sendRedirect("main.jsp");
		} else {	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 페이지</title>
<style>
	input[type="number"] {
		width : 2.5em;
	}
	form {
		display : inline;
	}
	table {
		border-collapse : collapse;
		text-align : center;
	}
	td {
		padding : 5px;
	}
	
</style>
</head>
<body>
	<%@ include file="/common/header.jsp" %>
	<h3>회원 정보 삭제</h3>
	<ul>
		<li>회원번호 : <%= member.getNo() %> </li>
		<li>아이디 : <%= member.getId() %> </li>
		<li>닉네임 : <%= member.getNickname() %> </li>
		<li>가입날짜 : <%= member.getRegdate()%> </li>
	</ul>
	<br>
	<a href="remove.jsp?no=<%= member.getNo() %>"><button>삭제</button></a>
	<a href="detailPage.jsp"><button>취소</button></a>
</body>
	<%@ include file="/common/footer.jsp" %>
</html>
	<% 	}
	}  %>