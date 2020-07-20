<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.ondongne.teampjt.circle.dao.Dao" %>
<%@page import="com.ondongne.teampjt.circle.dto.Dto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String region = request.getParameter("region");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");
		String event_date = request.getParameter("event_date");
		String end_date = request.getParameter("end_date");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");

		Dto dto = new Dto();
		dto.setTitle(title);
		dto.setRegion(region);
		dto.setZipcode(zipcode);
		dto.setAddress(address);
		dto.setAddress_detail(address_detail);
		dto.setEvent_date(event_date);
		dto.setEnd_date(end_date);
		dto.setGender(gender);
		dto.setDescription(description);
		
		SqlSessionFactory factory = Dao.getConn();
		SqlSession sqlsession = factory.openSession();
		sqlsession.insert("circleInsert",dto);
		sqlsession.commit();
		sqlsession.close();
		
		response.sendRedirect("circlePost.html");
	
	%>
</body>
</html>