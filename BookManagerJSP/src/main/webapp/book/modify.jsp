<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="Book.*"
	import="BookOracle.*"    
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	String priceStr = request.getParameter("price");
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	}
	else if (priceStr == null) {
		response.sendRedirect("detailPage.jsp?no=" + noStr);
	} else {
		BookService service = new BookService(new OracleBookDAO());
		Book book = new Book(Integer.parseInt(noStr), null, null, null, Integer.parseInt(priceStr));
		book.setNo(Integer.parseInt(noStr));
			if(service.edit(book, priceStr)) {
				response.sendRedirect("main.jsp");
			} else {
				response.sendRedirect("modifyPage.jsp?no=" + noStr);	
			}	
	}
%>    
