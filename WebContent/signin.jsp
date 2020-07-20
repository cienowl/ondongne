<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.teampjt.users.dto.DataTransferSignup"%>
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

    //로그인 정보 확인 페이지
    String email = request.getParameter("signinEmail");
    String password = request.getParameter("signinPassword");
    String dbEmail = null;
    String dbPassword = null;
    String targetUrl = null;
    Cookie cookie = null;
    
    //아이디 저장클릭시 쿠키에 아이디 저장
    String storeEmail = request.getParameter("storeEmail");
    if (storeEmail == null) {
        storeEmail = "false";
    }

    
    DataAccessUsers dao = DataAccessUsers.getInstance();
    SqlSessionFactory factory = DataAccessUsers.getConnection();
    SqlSession sqlSession = factory.openSession();
    
    DataTransferSignup dto = sqlSession.selectOne("checkSignin", email);
    
    dbEmail = dto.getEmail();
    dbPassword = dto.getPassword();
	
    //정보가 DB와 일치하면 입력한 이메일 세션에 등록 후 mypage.html 로 이동, 틀리면 이전페이지로 이동
    if(email.equals(dbEmail) && password.equals(dbPassword)) {
        session.setAttribute("email", email);
        targetUrl = "mypage.html";

        if (storeEmail.equals("true")) {
            cookie = new Cookie("EMAIL", email);
            response.addCookie(cookie);     //이메일 쿠키를 만들고 추가
            //result = "add";
        } else {
            cookie = new Cookie("EMAIL", "");   //쿠키 이메일부분 리셋
            //cookie.setMaxAge(0);
            response.addCookie(cookie);
            //result = "reset";
        }
    } else {
        targetUrl = "index.jsp";
    }

    //페이지 이동
    response.sendRedirect(targetUrl);
%>