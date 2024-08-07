<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file="/common/isAdminLogged.jsp" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
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
	<h3>도서 등록</h3>
	<form action="addBook.jsp" method="post">
		<input type="text" name="bookname" placeholder="도서명"><br>
		<input type="text" name="author" placeholder="작가명"><br>
		<input type="text" name="publisher" placeholder="출판사명"><br>
		<input type="text" name="price1" placeholder="가격"><br>
		<br>
		<input type="submit" value="등록">
		<a href="main.jsp"><input type="button" value="취소"></a>
	</form>
			<%@ include file="/common/footer.jsp" %>
</body>
</html>