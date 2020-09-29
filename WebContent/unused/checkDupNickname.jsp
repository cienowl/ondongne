<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessUsers"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");

    String inputNickname = request.getParameter("inputNickname");
    String getNickname = null;
    String result = null;

    DataAccessUsers dao = DataAccessUsers.getInstance();
    SqlSessionFactory factory = DataAccessUsers.getConnection();
    SqlSession sqlSession = factory.openSession();

    getNickname = sqlSession.selectOne("checkNickname", inputNickname);

    if (getNickname != null) {
        result = "이미 존재하는 닉네임입니다.";
    } else {
        result = "";
    }

    out.println(result);
%>