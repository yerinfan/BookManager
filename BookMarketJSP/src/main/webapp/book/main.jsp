<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="BookOracle.*"
	import="java.util.*"
    pageEncoding="UTF-8"%>
  
 <%@ include file="/common/isAdminLogged.jsp" %>       
    
<%
	BookService service = new OracleBookService(new OracleBookDAO()); // 멤버다오에서 갈아끼워넣을 수 있다.
	List<Book> bookList = service.listAll();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 관리 메인 페이지</title>
</head>
<body>
			<%@ include file="/common/header.jsp" %>
	<h1>도서 관리 메인 페이지</h1>
	<a href = "addBookPage.jsp"><button>도서 등록</button></a>
	<br>
	<h3>도서 목록</h3>
	<%
		if(bookList.size() == 0) { %>
		<p> 등록되어 있는 도서가 없습니다.
	<% } else { %>
	<table>
		<tr><th>도서 번호</th><th>도서명</th><th>작가명</th><th>출판사명</th><th>가격</th></tr>
		<% for(Book b : bookList) { %>
			<tr>
				<td><%= b.getNo()%></td>
				<td><a href="detailPage.jsp?no=<%= b.getNo()%>"><%= b.getBookname()%></a></td>
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