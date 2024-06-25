<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "member.*"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	if (id == null || password == null || nickname == null) {
		response.sendRedirect("registPage.jsp");
	} else {
		// 조건은 다 맞았다치고
		MemberService service = new MemberService(new MemberDAO());
		Member member = new Member(id, password, nickname);
		if (service.regist(member)) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("registPage.jsp");
			// 중복 확인 처리도 들어가야 됨
		}
	}
%>    
