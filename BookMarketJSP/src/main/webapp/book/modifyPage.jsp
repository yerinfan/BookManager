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
<title>도서 가격 정보 수정 페이지</title>
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
	<h3>도서 가격 정보 수정</h3>
	<form action="modify.jsp" method="post">
		<input type="hidden" name="no" value="<%= book.getNo() %>">
		<input type="text" name="price" value="<%= book.getPrice() %>" placeholder="가격"><br>
		<br>
		<input type="submit" value="정보수정">
		<a href="detailPage.jsp?no=<%= book.getNo() %>"><input type="button" value="취소"></a>
	</form>
			<%@ include file="/common/footer.jsp" %>
</body>
</html>
	<% 	}
	}  %>