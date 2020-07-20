<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.teampjt.users.dao.DataAccessUsers"%>
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
        
    if (getEmail != null) {
    	result = "이미 존재하는 이메일입니다.";
    } else {
    	result = "사용 가능한 이메일입니다.";
    }
    
    out.println(result);
%>