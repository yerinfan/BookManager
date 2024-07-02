<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookService service = new OracleBookService(new OracleBookDAO()); // 멤버다오에서 갈아끼워넣을 수 있다.
	List<Book> bookList = service.listAll();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to YE BookMarket</title>
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
	
	<h3>도서목록</h3>
	<%
		if(bookList.size() == 0) { %>
		<p> 등록되어 있는 도서가 없습니다.
	<% } else { %>
	<table>
		<tr><th>도서 번호</th><th>도서명</th><th>작가명</th><th>출판사명</th><th>가격</th></tr>
		<% for(Book b : bookList) { %>
			<tr>
				<td><%= b.getNo()%></td>
				<td><a href="<%= request.getContextPath() %>/book/detailPage.jsp?no=<%= b.getNo()%>"><%= b.getBookname()%></a></td>
				<td><%= b.getAuthor() %></td>
				<td><%= b.getPublisher() %></td>
				<td><%= b.getPrice() %></td>
			</tr>
		<% } %>	
	</table>
<% } %>
	
	<%@ include file="/common/footer.jsp" %>
	
</body>
</html>