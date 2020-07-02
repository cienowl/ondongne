<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8"); %>

<!doctype html>
<html>	

	<head>
		<meta charset="UTF-8">
		<title>Document</title>
 	</head>

 	<body>
		<%@page import="java.sql.*"%>
		<%
			String email = request.getParameter("signupEmail");
			String password  = request.getParameter("signupPassword1");

			if(email == null && password == null)
				throw new Exception("정보를 입력해주세요.");

			Connection conn = null;
			Statement stmt = null;

			try {

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ondongne", "root", "34811005");

				if(conn ==null)
					throw new Exception("데이터베이스에 연결할 수 없습니다.");

				stmt = conn.createStatement();
				String command ="insert into userinfo(email, password, joindate) values('"+email+"', '"+password+"', now());";
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

			response.sendRedirect("mypage.html?email=" + email);
		%>
	</body>
</html>
