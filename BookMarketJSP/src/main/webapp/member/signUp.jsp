<%@ page language="java" contentType="text/html; charset=UTF-8"
	import = "member.*"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	
	if (id == null || password == null || nickname == null) { // request 파라미터 자체가 없을 때
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=1");
	
	} else if (id.isEmpty() || password.isEmpty() || nickname.isEmpty()) { // request 파라미터 있는데 값이 없음
		response.sendRedirect(request.getContextPath() + "/member/signUpPage.jsp?joinError=1");
	
	} else {
		// 조건은 다 맞았다치고
		MemberService service = new OracleMemberService(new MemberDAO());
		Member member = new Member(id, password, nickname);
		if (service.regist(member)) {
			response.sendRedirect(request.getContextPath() + "/member/signInPage.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=2");
			// 중복 확인 처리도 들어가야 됨
		}
	}
%>    
