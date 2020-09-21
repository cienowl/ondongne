<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ondongne.dto.DataTransferCircle"%>
<%@page import="com.ondongne.dao.DataAccessCircle"%>
<%@page import="com.ondongne.dao.DataAccessCircleJoin"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");

	//페이지 수에 따라 12개씩 출력
	int pageOffset = Integer.parseInt((String) request.getParameter("page"))*12;

    DataAccessCircle daoCircle = DataAccessCircle.getinstance();
    SqlSessionFactory factory = DataAccessCircle.getConnection();
    SqlSession sqlSession = factory.openSession();

    List<DataTransferCircle> getCircleList = sqlSession.selectList("selectCirclePostAllPaging", pageOffset);
    sqlSession.close();
    
    Gson gson = new Gson();

	String resultCircle = gson.toJson(getCircleList);

	out.println(resultCircle);
%>