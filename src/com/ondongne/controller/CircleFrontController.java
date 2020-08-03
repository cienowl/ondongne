package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.GetCircleAction;
import com.ondongne.action.GetJoinCircleAction;
import com.ondongne.action.JoinCircleAction;
import com.ondongne.action.PostCircleAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.circle")
public class CircleFrontController extends HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			ActionForward forward = null;
			Action action = null;
			
			// 소모임 게시판으로 이동
			if(command.equals("/view.circle")) {
				
				action = new GetCircleAction();
				try {
					forward = action.execute(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			// 소모임 페이지의 글작성 버튼을 눌렀을때
			else if(command.equals("/postform.circle")) {
				forward = new ActionForward();
				forward.setPath("/circlePostForm.jsp");
			}
			
			// 게시물 입력폼 작성후 등록버튼을 눌렀을 때
			else if(command.equals("/postinsert.circle")) {
				action = new PostCircleAction();
				try {
					forward=action.execute(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			
			// 소모임 게시글 참여버튼을 눌렀을때
			else if(command.equals("/postjoin.circle")) {
				action = new JoinCircleAction();
				try {
					forward = action.execute(request, response);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			// 소모임 참여를 했을 때 select 후 mypage에 출력
			else if(command.equals("/selectjoinpost.circle")) {
				action = new GetJoinCircleAction();
				try {
					forward = action.execute(request, response);
				}catch(Exception e) {
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
