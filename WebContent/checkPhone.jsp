<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.ondongne.dao.DataAccessUsers"%>
<%
	// 작성자: 김나예

    request.setCharacterEncoding("utf-8");

    String phone = request.getParameter("inputPhone");
    String getPhone=null;
    String result = null;

    DataAccessUsers dao = DataAccessUsers.getInstance();
    SqlSessionFactory factory = DataAccessUsers.getConnection();
    SqlSession sqlSession = factory.openSession();

    getPhone = sqlSession.selectOne("checkPhone", phone);
	//out.print(getPhone);
    
    if (getPhone != null) {
        result = "이미 존재하는 핸드폰번호입니다.";
    } else {
        result = "";
    }

    out.print(result);
%>