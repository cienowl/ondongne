<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<!doctype html>
<html>
	<head>
  		<meta charset="UTF-8">
  		<title>Document</title>
	</head>
	<body>
		<%@ page import="java.sql.*" %>
		<%
			String email = request.getParameter("inputEmail");
			String password = request.getParameter("inputPassword");
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
			///String signedEmail = session.getParameter("signedEmail");

			Connection conn = null;
			Statement stmt = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ondongne","root","34811005");

				if (conn==null)
					throw new Exception("데이터베이스에 연결할 수 없습니다.");

				stmt = conn.createStatement();
				String command = "update userinfo set email='"+email+"',password='"+password+"',phone='"+phone+"',birth_year='"+birth_year+"',birth_month='"+birth_month+"',birth_day='"+birth_day+"',gender='"+gender+"',nickname='"+nickname+"',zipcode='"+zipcode+"',address='"+address+"',address_detail='"+address_detail+"',region1='"+region1+"',region2='"+region2+"',region3='"+region3+"' where email='nayeee53@naver.com';";
				//where email에 'signedEmail'이 들어가야함.

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
			response.sendRedirect("mypage.html");
			//정보수정이 끝나면 mypage로 감
				
		%>
	</body>
</html>
