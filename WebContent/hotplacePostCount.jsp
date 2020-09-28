<%@page import="com.ondongne.dao.DataAccessHotplace"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessHotplace"%>
<%@page import="com.ondongne.service.HotplaceService" %>
<%@page import="com.ondongne.dto.HotplaceBean" %>
<%@page import="java.util.List" %>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");

	int postid = Integer.parseInt((String)request.getParameter("postid"));
	//int i = Integer.parseInt((String)request.getParameter("i"));
	
	//out.print(i);
	
	DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
	SqlSessionFactory factory = daoHotplace.getConnection();
	SqlSession sqlSession = factory.openSession();
	
	sqlSession.update("placePostCount",postid);
	int post_count = sqlSession.selectOne("getPlacePostCount",postid);
	sqlSession.commit();
	sqlSession.close();
	
	out.print(post_count);
%>