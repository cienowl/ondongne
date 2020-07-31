<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.dao.DataAccessUsers" %>
<%@page import="com.ondongne.dto.DataTransferUsers" %>

<%
	request.setCharacterEncoding("utf-8");

	String sessionEmail = (String) session.getAttribute("email");
	String email = request.getParameter("inputEmail");
	String password = request.getParameter("inputPassword1");
	String phone = request.getParameter("inputPhone");
	String birthday = request.getParameter("inputBirthday");
	String gender = request.getParameter("inputGender");
	String nickname = request.getParameter("inputNickname");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("roadAddress");
	String address_detail = request.getParameter("detailAddress");
	String region1 = request.getParameter("inputRegion1");
	String region2 = request.getParameter("inputRegion2");
	String region3 = request.getParameter("inputRegion3");

	DataTransferUsers dto = new DataTransferUsers();
	dto.setSessionEmail(sessionEmail);
	dto.setEmail(email);
	dto.setPassword(password);
	dto.setPhone(phone);
	dto.setBirthday(birthday);
	dto.setGender(gender);
	dto.setNickname(nickname);
	dto.setZipcode(zipcode);
	dto.setAddress(address);
	dto.setAddress_detail(address_detail);
	dto.setRegion1(region1);
	dto.setRegion2(region2);
	dto.setRegion3(region3);

	SqlSessionFactory factory = DataAccessUsers.getConnection();
	SqlSession sqlsession = factory.openSession();
	sqlsession.update("userUpdate", dto);
	sqlsession.commit();
	sqlsession.close();
	
	session.setAttribute("email", email);
	
	response.sendRedirect("mypage.html");
%>