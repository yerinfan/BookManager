<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="BookOracle.*"
	import="cart.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>

	<a href="<%= request.getContextPath() %>/index.jsp"><button>Home</button></a>
	
<%
	if (session.getAttribute("MemberId") != null) {
%>
  	<a href="<%= request.getContextPath() %>/member/logout.jsp"><button>로그아웃</button></a>
    <a href="<%= request.getContextPath() %>/member/detailPage.jsp?no=<%=(Integer)session.getAttribute("MemberNo")%>"><button>My Page</button></a>
	<a href="<%= request.getContextPath() %>/cart/main.jsp"><button>장바구니</button></a>

<% } else if (session.getAttribute("AdminId") != null) {  %>
	
	<a href="<%= request.getContextPath() %>/member/logout.jsp"><button>로그아웃</button></a>
    <a href="<%= request.getContextPath() %>/member/detailPage.jsp?no=<%=(Integer)session.getAttribute("MemberNo")%>"><button>My Page</button></a>

<% } else { %>

 	<a href="<%= request.getContextPath() %>/member/signInPage.jsp"><button>로그인</button></a>
	<a href="<%= request.getContextPath() %>/member/signUpPage.jsp"><button>회원가입</button></a>
	
<% } %>
	<h2>예은. 온라인 서점</h2>
	<hr>