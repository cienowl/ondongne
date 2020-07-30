package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.UserDeleteAction;
import com.ondongne.action.UserSigninAction;
import com.ondongne.action.UserSignoutAction;
import com.ondongne.action.UserSignupBasicAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.users")
public class UsersFrontController extends HttpServlet
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			request.setCharacterEncoding("UTF-8");
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			ActionForward forward = null;
			Action action = null;
			
			if (command.equals("/signin.users")) {
//				로그인
				action = new UserSigninAction();
				try {
					forward=action.execute(request, response);	
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			else if (command.equals("/signout.users")) {
//				로그아웃
				action = new UserSignoutAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/signup.users")) {
//				최초 회원가입
				action = new UserSignupBasicAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}
			
//			TODO: 회원가입 추가정보
			else if(command.equals("/signupadd.users")) {
				
			}
			
//			TODO: 회원정보 수정
			else if(command.equals("/update.users")) {
				
			}
			
//			TODO: 회원탈퇴
			else if(command.equals("/delete.users")) {
				action = new UserDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}
			
			if (forward != null) {		
				if (forward.isRedirect()) {		
					response.sendRedirect(forward.getPath());	
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());	
					dispatcher.forward(request, response);
				}
				
			}
			
		}
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request,response);
		} 
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request,response);
		}

}
