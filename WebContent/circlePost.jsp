<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.teampjt.circle.dao.DataAccessCircle" %>
<%@page import="com.ondongne.teampjt.circle.dto.DataTransferCircle" %>

<%
	// 작성자: 김나예
	request.setCharacterEncoding("utf-8");

	String email = (String) session.getAttribute("email");
	String title = request.getParameter("title");
	String region = request.getParameter("region");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String address_detail = request.getParameter("address_detail");
	String event_date = request.getParameter("event_date");
	String end_date = request.getParameter("end_date");
	String gender = request.getParameter("gender");
	String description = request.getParameter("description");

	DataTransferCircle dto = new DataTransferCircle();
	dto.setEmail(email);
	dto.setTitle(title);
	dto.setRegion(region);
	dto.setZipcode(zipcode);
	dto.setAddress(address);
	dto.setAddress_detail(address_detail);
	dto.setEvent_date(event_date);
	dto.setEnd_date(end_date);
	dto.setGender(gender);
	dto.setDescription(description);

	SqlSessionFactory factory = DataAccessCircle.getConnection();
	SqlSession sqlsession = factory.openSession();
	sqlsession.insert("circleInsert", dto);
	sqlsession.commit();
	sqlsession.close();

	response.sendRedirect("circle.html");
%>