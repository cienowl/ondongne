<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessUsers"%>
<%@page import="java.sql.*"%>
<%
	/*
    작성자:
        JSP	- 이호준
    */

    request.setCharacterEncoding("utf-8"); 

    String email = request.getParameter("inputEmail");
    String getEmail = null;
    String result = null;
        
    DataAccessUsers dao = DataAccessUsers.getInstance();    
    SqlSessionFactory factory = DataAccessUsers.getConnection();
    SqlSession sqlSession = factory.openSession();
    
    getEmail = sqlSession.selectOne("checkEmail", email);
    
    if (getEmail == null) {
    	result = "가입된 이메일이 없습니다.";
    } else if (email.equals(getEmail)) {
    	result = "";    	
    }
    
    out.println(result);
%>