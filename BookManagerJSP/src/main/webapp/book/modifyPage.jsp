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
		if (book == null) {
			response.sendRedirect("main.jsp");
		} else {	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 가격 정보 수정 페이지</title>
</head>
<body>
	<h3>도서 가격 정보 수정</h3>
	<form action="modify.jsp" method="post">
		<input type="hidden" name="no" value="<%= book.getNo() %>">
		<input type="text" name="price" value="<%= book.getPrice() %>" placeholder="가격"><br>
		<br>
		<input type="submit" value="정보수정">
		<a href="detailPage.jsp?no=<%= book.getNo() %>"><input type="button" value="취소"></a>
	</form>
</body>
</html>
	<% 	}
	}  %>