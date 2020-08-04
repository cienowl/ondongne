package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.GetJoinCircleAction;
import com.ondongne.action.GetMyPageInfoAction;
import com.ondongne.action.NoticeViewAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.ondongne")
public class MainFrontController extends HttpServlet {
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
	
		if (command.equals("/index.ondongne")) {
//			index 페이지로 이동
			forward = new ActionForward();
			forward.setPath("index.jsp");
		}
		
		else if (command.equals("/team.ondongne")) {
			forward = new ActionForward();
			forward.setPath("team.jsp");			
		}
		
		else if (command.equals("/terms.ondongne")) {
			forward = new ActionForward();
			forward.setPath("terms.jsp");			
		}
		
		else if (command.equals("/privacy.ondongne")) {
			forward = new ActionForward();
			forward.setPath("privacy.jsp");			
		}
		
		else if (command.equals("/service.ondongne")) {
			forward = new ActionForward();
			forward.setPath("project.jsp");			
		}
		
		else if (command.equals("/mypage.ondongne")) {
			action = new GetJoinCircleAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/mypagetest.ondongne")) {
//			Mypage 테스트용
			action = new GetMyPageInfoAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/notice.ondongne")) {
			action = new NoticeViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		
		if (forward != null) {		//forward 내 값이 있으면
			if (forward.isRedirect()) {		//forward의 isRedirect() 값이 true 면
				response.sendRedirect(forward.getPath());	//forward객체에 새로 setting 된 경로로 이동, sendRedirect는 get, post 방식이 아니기때문에 @WebServlet 항목으로 결정
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());	//기존 path로 이동
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	
	
	
	//action method 가 get 인 경우 doProcess 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}  	
	
	//action method 가 post 인 경우 doProcess 실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}   

}
