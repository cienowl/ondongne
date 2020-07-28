<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.DataTransferSell"%>
<%@page import="com.ondongne.dao.DataAccessSell"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="java.sql.*"%>
<%
	/*
    작성자: 이호준
    */

    request.setCharacterEncoding("utf-8"); 

    String email = (String) session.getAttribute("email");
    //String email = "leehj.david@gmail.com";
    String title = request.getParameter("title");
    String isAuction = request.getParameter("isAuction");
    String sellMethod = request.getParameter("sellMethod");
    String sellPrice = request.getParameter("sellPrice");
    String endDate = request.getParameter("end_date");
    String endTime = request.getParameter("end_time");
    String region = request.getParameter("region");
    String description = request.getParameter("description");
    //String pictures = request.getParameter("pictures");
    String pictures = "pictures";
    //String tags = request.getParameter("tags");
    String tags = "tags";
    
    
    DataTransferSell dto = new DataTransferSell();
    dto.setEmail(email);
    dto.setTitle(title);
    dto.setPictures(pictures);
    dto.setRegion(region);
    dto.setStarting_price(sellPrice);
    dto.setIs_auction(isAuction);
    dto.setSell_method(sellMethod);
    dto.setEnd_date(endDate);
    dto.setEnd_time(endTime);    
    dto.setDescription(description);
    dto.setTags(tags);
    
    DataAccessSell dao = DataAccessSell.getInstance();
    SqlSessionFactory factory = DataAccessSell.getConnection();
    SqlSession sqlSession = factory.openSession();
    sqlSession.insert("sellPost", dto);
    sqlSession.commit();
    sqlSession.close();
    
    response.sendRedirect("sell.jsp");    
%>