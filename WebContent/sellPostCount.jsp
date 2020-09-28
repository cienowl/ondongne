<%@page import="com.ondongne.dao.DataAccessSell"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessSell"%>
<%@page import="com.ondongne.service.SellService" %>
<%@page import="com.ondongne.dto.DataTransferSell" %>
<%@page import="java.util.List" %>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");

	int postid = Integer.parseInt((String)request.getParameter("postid"));
	
	DataAccessSell daoSell = DataAccessSell.getInstance();
	SqlSessionFactory factory = daoSell.getConnection();
	SqlSession sqlSession = factory.openSession();
	
	sqlSession.update("sellPostCount",postid);
	int post_count = sqlSession.selectOne("sellGetPostCount",postid);
	sqlSession.commit();
	sqlSession.close();
	
	out.print(post_count);
%>