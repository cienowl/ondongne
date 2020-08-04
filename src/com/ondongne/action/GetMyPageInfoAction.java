package com.ondongne.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.action.Action;
import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;

public class GetMyPageInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String loginEmail = (String) session.getAttribute("email");
		
		if (loginEmail != null) {			
			
			CircleService circleService = new CircleService();
			
			List<DataTransferCircle> circleList = circleService.selectJoinCircle(loginEmail);
			
			request.setAttribute("circleList",circleList);
			
			forward.setPath("mypage_test.jsp");
		} else {
			forward.setRedirect(true);
			forward.setPath("index.ondongne");
		}		
		
		return forward;
	}
	
}
