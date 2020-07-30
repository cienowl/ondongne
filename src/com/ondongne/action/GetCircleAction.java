package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;

public class GetCircleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		CircleService circleService = new CircleService();
		List<DataTransferCircle> circleList = circleService.selectCircleAll();
		
		request.setAttribute("circleList", circleList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/circle.jsp");
		
		return forward;
	}

}
