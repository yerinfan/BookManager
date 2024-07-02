<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/isLoggedIn.jsp" %> 
   
<%
	String noStr = request.getParameter("no");
	if (noStr == null) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?detailError=1");
	} else {
		MemberService service = new OracleMemberService(new MemberDAO());
		Member member = service.read(Integer.parseInt(noStr));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 페이지</title>
</head>
<body>

<%@ include file="/common/header.jsp" %>

	<h3>회원 상세 정보</h3>
<% 	if (member == null) { %>
		<p> 해당 회원 정보가 없습니다. </p>
<% 	} else {  %>
		<ul>
			<li>회원번호 : <%= member.getNo() %> </li>
			<li>아이디 : <%= member.getId() %> </li>
			<li>닉네임 : <%= member.getNickname() %> </li>
			<li>가입날짜 : <%= member.getRegdate()%> </li>
		</ul>
		<br>
		<% if (session.getAttribute("MemberId") != null) { %>
		<a href="modifyPage.jsp?no=<%= member.getNo() %>"><button>회원 정보 수정</button></a>
		<a href="removePage.jsp?no=<%= member.getNo() %>"><button>회원 탈퇴</button></a>
		<% } else {%>
		<a href="removePage.jsp?no=<%= member.getNo() %>"><button>회원 삭제</button></a>
		<% }
		}
%>
		
<%@ include file="/common/footer.jsp" %>

</body>
</html>
<%  }  %>