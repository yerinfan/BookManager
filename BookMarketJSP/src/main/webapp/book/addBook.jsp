<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="BookOracle.*"
    pageEncoding="UTF-8"%>
<%
	String bookname = request.getParameter("bookname");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String priceStr = request.getParameter("price1");
	
	// ***** null 값을 못 잡아냄
	if (bookname == null || author == null || publisher == "" || priceStr == null) {
		response.sendRedirect("addBookPage.jsp");
	} else {
		BookService service = new OracleBookService(new OracleBookDAO());
		int price = Integer.parseInt(priceStr);
		Book book = new Book(bookname, author, publisher, price);
		if (service.add(book)) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("addBookPage.jsp");
			// 중복 확인 처리도 들어가야 됨
		}
	}
%>    
