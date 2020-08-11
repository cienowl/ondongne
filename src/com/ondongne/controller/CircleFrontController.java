package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.CancelJoinCircleAction;
import com.ondongne.action.JoinCircleAction;
import com.ondongne.action.DeleteCircleAction;
import com.ondongne.action.GetCircleAction;
import com.ondongne.action.PostCircleAction;
import com.ondongne.action.UpdateCircleAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.circle")
public class CircleFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		
		// 소모임 게시글 참여버튼을 눌렀을때 이미 참여한 게시물인지 check
		else if(command.equals("/duplicateCheck.circle")) {
			action = new JoinCircleAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
			
		
		// 작성자가 소모임 게시글 수정버튼을 눌렀을 때
		else if(command.equals("/postupdateform.circle")) {
			forward = new ActionForward();
			forward.setPath("/circleUpdateForm.jsp");
		}
		
		// 작성자가 소모임 수정할 정보를 모두 입력하고 버튼을 눌렀을 때
		else if(command.equals("/postupdate.circle")) {
			action = new UpdateCircleAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		// 작성자가 소모임 게시글 삭제버튼을 눌렀을 때
		else if(command.equals("/postdelete.circle")) {
			action = new DeleteCircleAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		// 참여자가 소모임 참여 취소버튼을 눌렀을 때
		else if(command.equals("/joincancel.circle")) {
			action = new CancelJoinCircleAction();
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
