<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>

<%@ include file="/common/isLoggedIn.jsp" %>

<%
	CartService service = new OracleCartService(new OracleCartDAO());

	if (service.clear(memberNo)) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?cartClearErr=1");
	}
%>