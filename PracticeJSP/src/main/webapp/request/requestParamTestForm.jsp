<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client request parameter 읽기 연습</title>
</head>
<body>
	<h1>Client request parameter 읽기 연습</h1>
	<form action="requestParamTest.jsp" method="post">
		아이디 : <input type ="text" name ="id" value=""><br>
		과정 : <input type ="radio" name="course" value="1학년" checked="checked">1학년
			  <input type ="radio" name="course" value="2학년">2학년
			  <br>
		관심 : <input type="checkbox" name="favorite" value="자바">자바
			  <input type="checkbox" name="favorite" value="JSP" checked ="checked">JSP
			  <input type="checkbox" name="favorite" value="데이터베이스">데이터베이스
			  <br>		  
		자기소개 : <textarea name="intro" value="" row="5" cols="50"></textarea>
		<br>
		<input type="submit" value="전송">
		
	</form>
</body>
</html>