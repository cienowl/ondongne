<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.dao.DataAccessUsers" %>
<%@page import="com.ondongne.dto.DataTransferUsers" %>

<%
	request.setCharacterEncoding("utf-8");

	String sessionEmail = (String) session.getAttribute("email");
	SqlSessionFactory factory = DataAccessUsers.getConnection();
	SqlSession sqlsession = factory.openSession();
	sqlsession.delete("userDelete", sessionEmail);
	sqlsession.commit();
	sqlsession.close();
	
	session.invalidate();
	
	response.sendRedirect("index.jsp");
%>
