<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 페이지</title>
</head>
<body>
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
</body>
</html>