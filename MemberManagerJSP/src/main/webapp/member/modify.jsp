<%@ page language="java" contentType="text/html; charset=UTF-8"
   	import="member.*"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	String oldPwd = request.getParameter("old_password");
	String newPwd = request.getParameter("new_password");
	String nickname = request.getParameter("nickname");
	if (noStr == null) {
		response.sendRedirect("main.jsp");
	}
	else if (oldPwd == null|| newPwd == null || nickname == null) {
		response.sendRedirect("detailPage.jsp?no=" + noStr);
	} else {
		// 조건은 다 맞았다치고
		MemberService service = new MemberService(new MemberDAO());
		Member member = new Member(null, newPwd, nickname);
		member.setNo(Integer.parseInt(noStr));
			if(service.edit(member, oldPwd)) {
				response.sendRedirect("main.jsp");
			} else {
				response.sendRedirect("modifyPage.jsp?no=" + noStr);	
			}	
	}
%>    
