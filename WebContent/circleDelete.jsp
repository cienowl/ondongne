<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	로그인된 이메일<%=session.getAttribute("email") %>
	<% String postid = request.getParameter("postid"); %>
	글번호<%=postid %>
</body>
</html>