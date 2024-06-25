<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="BookOracle.*"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		BookService service = new BookService(new OracleBookDAO());
		Book book = service.read(Integer.parseInt(noStr));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보 페이지</title>
</head>
<body>
	<h3>회원 상세 정보</h3>
<% 	if (book == null) { %>
		<p> 해당 도서 정보가 없습니다. </p>
<% 	} else {  %>
		<ul>
			<li>도서번호 : <%= book.getNo() %> </li>
			<li>도서명 : <%= book.getBookname() %> </li>
			<li>작가명 : <%= book.getAuthor() %> </li>
			<li>출판사명 : <%= book.getPublisher() %> </li>
			<li>가격 : <%= book.getPrice() %> </li>
		</ul>
		<br>
		<a href="modifyPage.jsp?no=<%= book.getNo() %>"><button>가격수정</button></a>
		<a href="removePage.jsp?no=<%= book.getNo() %>"><button>도서삭제</button></a>
<% 	}  %>
</body>
</html>
<% 	}  %>