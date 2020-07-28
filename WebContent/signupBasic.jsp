<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessUsers"%>
<%@page import="com.ondongne.dto.DataTransferUsers"%>
<%@page import="java.sql.*"%>
<%
	/*
	작성자:
		JSP	- 이호준
	*/
	
	request.setCharacterEncoding("utf-8"); 

	String email = request.getParameter("signupEmail");
	String password  = request.getParameter("signupPassword1");
	
	//if(email == null || password == null)
	//	throw new Exception("정보를 입력해주세요.");

	DataTransferUsers dto = new DataTransferUsers();
	
	dto.setEmail(email);
	dto.setPassword(password);
	
	DataAccessUsers dao = DataAccessUsers.getInstance();
	SqlSessionFactory factory = DataAccessUsers.getConnection();
	SqlSession sqlSession = factory.openSession();
	
	sqlSession.insert("insertBasicInfo", dto);
	sqlSession.commit();
	sqlSession.close();
	
	//옵션1: 회원가입과 동시에 세션에 이메일 정보 등록
	session.setAttribute("email", email);
	response.sendRedirect("index.jsp");

	//옵션2: 회원가입 후 로그인 창으로 이동
	//response.sendRedirect("index.jsp#signinModal");
%>
