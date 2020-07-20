<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    /*
    작성자:
        JSP	- 김나예
    */

    request.setCharacterEncoding("utf-8"); 

    String inputNickname = request.getParameter("inputNickname");
    String result = null;

    Connection conn = null;
	Statement stmt = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ondongne","root","34811005");

		if (conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");

		stmt = conn.createStatement();
		
		String command = "SELECT nickname FROM userinfo WHERE nickname='" + inputNickname + "';";
        ResultSet rs = stmt.executeQuery(command);

        if (rs.next()) {
            result = "이미 존재하는 닉네임입니다.";
        } else {
            result = "사용가능한 닉네임입니다.";
        }

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

    out.println(result);
%>