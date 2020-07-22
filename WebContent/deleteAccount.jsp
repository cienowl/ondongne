<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.teampjt.users.dao.DataAccessUsers" %>
<%@page import="com.ondongne.teampjt.users.dto.DataTransferUsers" %>

<%
	request.setCharacterEncoding("utf-8");

	String email = (String) session.getAttribute("email");
	//String signed_email = "naye@naver.com";
	SqlSessionFactory factory = DataAccessUsers.getConn();
	SqlSession sqlsession = factory.openSession();
	sqlsession.delete("userDelete", email);
	sqlsession.commit();
	sqlsession.close();
	
	response.sendRedirect("index.jsp");
%>
