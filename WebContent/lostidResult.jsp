<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.service.UsersService"%>
<%@page import="com.ondongne.dto.DataTransferUsers"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>

<%
	//작성자: 김나에 이호준
	
    request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	
	DataTransferUsers dtoUser = new DataTransferUsers();
	dtoUser.setName(name);
	dtoUser.setPhone(phone);
	
	UsersService userService = new UsersService();
	String email = userService.findEmail(dtoUser);
	
	String result = null;
	
	if (email != null) {
		String[] emailParse = email.split("@");
	    result = emailParse[0].substring(0,4) + emailParse[0].substring(4,emailParse[0].length()).replaceAll(".", "*") + "@" + emailParse[1];            
	} else {
		result = "null";
	}
	
	Gson gson = new Gson();
	
	JsonObject jsonObj = new JsonObject();
	jsonObj.addProperty("email", result);
	
	String json = gson.toJson(jsonObj);
	
	out.println(json);
%>