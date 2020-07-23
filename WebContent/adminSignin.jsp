<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 작성자: 이호준

    final String ADMIN_ID = "admin";
    final String ADMIN_PASSWORD = "1111";

    String id = request.getParameter("adminId");
    String password = request.getParameter("adminPassword");
    //String keepSession = request.getParameter("maintainSession");

    if (id.equals(ADMIN_ID) && password.equals(ADMIN_PASSWORD)) {
        response.sendRedirect("admin_dashboard.jsp");
        session.setAttribute("adminId", id);
    } else {
        response.sendRedirect("admin_index.html");
    }
%>
