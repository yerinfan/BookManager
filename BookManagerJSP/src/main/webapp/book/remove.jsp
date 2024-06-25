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
		if(service.remove(Integer.parseInt(noStr))) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("detailPage.jsp?no=" + noStr);
		}
	}
%>
