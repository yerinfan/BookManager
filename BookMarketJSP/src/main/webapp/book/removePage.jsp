<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="BookOracle.*"       	
    pageEncoding="UTF-8"%>
    
 <%@ include file="/common/isAdminLogged.jsp" %>       
    
<%
	String noStr = request.getParameter("no");
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		BookService service = new OracleBookService(new OracleBookDAO());
		Book book = service.detail(Integer.parseInt(noStr));
		if (book == null) {
			response.sendRedirect("main.jsp");
		} else {	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 삭제 페이지</title>
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
	<h3>도서 정보 삭제</h3>
	<ul>
		<li>도서번호 : <%= book.getNo() %> </li>
		<li>도서명 : <%= book.getBookname() %> </li>
		<li>작가명 : <%= book.getAuthor() %> </li>
		<li>출판사명 : <%= book.getPublisher() %> </li>
		<li>가격 : <%= book.getPrice() %> </li>
	</ul>
	<br>
	<a href="remove.jsp?no=<%= book.getNo() %>"><button>삭제</button></a>
	<a href="detailPage.jsp"><button>취소</button></a>
	
		<%@ include file="/common/footer.jsp" %>
</body>
</html>
	<% 	}
	}  %>