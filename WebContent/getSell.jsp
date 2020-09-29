
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.ondongne.dto.DataTransferSell"%>
<%@page import="com.ondongne.dao.DataAccessSell"%>
<%@page import="com.ondongne.dto.SearchSellBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%
	// 작성자: 이호준

    request.setCharacterEncoding("utf-8");

	//페이지 수에 따라 12개씩 출력
	int pageOffset = Integer.parseInt((String) request.getParameter("page"))*12;
    String searchWord = request.getParameter("searchWord");

    SearchSellBean searchSellBean = new SearchSellBean();
    searchSellBean.setSearchWord(searchWord);
    searchSellBean.setPage(pageOffset);

    DataAccessSell daoSell = DataAccessSell.getInstance();
    SqlSessionFactory factory = DataAccessSell.getConnection();
    SqlSession sqlSession = factory.openSession();

    List<DataTransferSell> searchSellList = sqlSession.selectList("searchSellListPaging", searchSellBean);
    sqlSession.close();

    Gson gson = new Gson();

	String resultSell = gson.toJson(searchSellList);

	out.println(resultSell);
%>