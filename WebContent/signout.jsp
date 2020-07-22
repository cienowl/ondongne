<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	//작성자: 이호준
		
	request.setCharacterEncoding("utf-8"); 

	// 로그아웃 하고 세션 삭제
	session.removeAttribute("email");
	session.invalidate();

	response.sendRedirect("index.jsp");
%>
