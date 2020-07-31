package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.AdminNoticeWriteAction;
import com.ondongne.action.AdminSigninAction;
import com.ondongne.action.AdminSignoutAction;
import com.ondongne.action.GetDashboardInfoAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.admin")
public class AdminFrontController extends HttpServlet {
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
	
		if (command.equals("/index.admin")) {
//			footer 에서 admin 버튼 누르면 admin_index.html 로 이동
			forward = new ActionForward();
			forward.setPath("/admin_index.jsp");
		}

		else if (command.equals("/signin.admin")) {
//			admin 페이지 로그인 action
			action = new AdminSigninAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/signout.admin")) {
//			admin 페이지 로그아웃 action
			action = new AdminSignoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		

		else if (command.equals("/dashboard.admin")) {
//			dashboard로 이동
			action = new GetDashboardInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		else if (command.equals("/notice/write.admin")) {
//			공지사항 작성
			action = new AdminNoticeWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/notice/delete.admin")) {
//		TODO: 공지사항 삭제
		}
		
		else if (command.equals("/notice/update.admin")) {
//		TODO: 공지사항 수정
			
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
