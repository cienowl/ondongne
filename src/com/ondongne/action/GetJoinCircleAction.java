package com.ondongne.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.action.Action;
import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;

public class GetJoinCircleAction implements Action {

	// 참여한 소모임 출력
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String loginEmail = (String)session.getAttribute("email");
		
		CircleService circleService = new CircleService();
		List<DataTransferCircle> circleList = circleService.selectJoinCircle(loginEmail);
		
		request.setAttribute("circleList",circleList);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("mypage.jsp");
		
		return forward;
	}
	
}
