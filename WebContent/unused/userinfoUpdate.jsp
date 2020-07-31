<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	/*
	작성자:
		JSP	- 김나예
	*/

	request.setCharacterEncoding("utf-8"); 

	String email = request.getParameter("inputEmail");
	String password = request.getParameter("inputPassword1");
	String phone = request.getParameter("inputPhone");
	String birthday = request.getParameter("inputBirthday");	
	String gender = request.getParameter("inputGender");
	String nickname = request.getParameter("inputNickname");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("roadAddress");
	String address_detail = request.getParameter("detailAddress");
	String region1 = request.getParameter("inputRegion1");
	String region2 = request.getParameter("inputRegion2");
	String region3 = request.getParameter("inputRegion3");

	String birth_year = birthday.substring(0,4);
	String birth_month = birthday.substring(4,6);
	String birth_day = birthday.substring(6);
	
	//session 로그인된 email정보 가져오기
	String signedEmail = (String) session.getAttribute("email");

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ondongne","root","34811005");

		if (conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");

		stmt = conn.createStatement();
		
		String command = "update userinfo set email='"+email+"',password='"+password+"',phone='"+phone+"',birth_year='"+birth_year+"',birth_month='"+birth_month+"',birth_day='"+birth_day+"',gender='"+gender+"',nickname='"+nickname+"',zipcode='"+zipcode+"',address='"+address+"',address_detail='"+address_detail+"',region1='"+region1+"',region2='"+region2+"',region3='"+region3+"' where email='"+signedEmail+"';";
		int rowNum = stmt.executeUpdate(command);

		if (rowNum < 1)
			throw new Exception("데이터를 DB에 입력할 수 없습니다.");

	} finally {
		try {
			stmt.close();
		} catch (Exception ignored) {
		}
		try {
			conn.close();
		} catch (Exception ignored) {
		}
	}

	//정보수정이 끝나면 mypage로 감
	session.setAttribute("email", email);	//이메일이 수정된경우를 위해 기존 session email의 값을 변경
	response.sendRedirect("mypage.html");
		
%>