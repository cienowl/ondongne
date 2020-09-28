
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ondongne.dto.HotplaceBean"%>
<%@page import="com.ondongne.dao.DataAccessHotplace"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%
	// 작성자: 이호준

    request.setCharacterEncoding("utf-8");

	//페이지 수에 따라 12개씩 출력
	int pageOffset = Integer.parseInt((String) request.getParameter("page"))*12;
        
    DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
    SqlSessionFactory factory = DataAccessHotplace.getConnection();
    SqlSession sqlSession = factory.openSession();

	List<HotplaceBean> getHotplaceList = sqlSession.selectList("selectHotplacePostAllPaging", pageOffset);
    sqlSession.close();

    Gson gson = new Gson();

	String resultHotplace = gson.toJson(getHotplaceList);

	out.println(resultHotplace);
%>