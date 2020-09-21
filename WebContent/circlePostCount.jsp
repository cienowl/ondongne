<%@page import="com.ondongne.dao.DataAccessCircle"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessCircle"%>
<%@page import="com.ondongne.service.CircleService" %>
<%@page import="com.ondongne.dto.DataTransferCircle" %>
<%@page import="java.util.List" %>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");

	int postid = Integer.parseInt((String)request.getParameter("postid"));
	//int i = Integer.parseInt((String)request.getParameter("i"));
	
	//out.print(i);
	
	DataAccessCircle daoCircle = DataAccessCircle.getinstance();
	SqlSessionFactory factory = daoCircle.getConnection();
	SqlSession sqlSession = factory.openSession();
	
	sqlSession.update("postCount",postid);
	int post_count = sqlSession.selectOne("getPostCount",postid);
	sqlSession.commit();
	sqlSession.close();
	
	out.print(post_count);
%>