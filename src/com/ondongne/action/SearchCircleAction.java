package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;

public class SearchCircleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String keyword = request.getParameter("search");
		System.out.println(keyword);
		
		CircleService circleService = new CircleService();
		List<DataTransferCircle> circleList = circleService.searchCircle(keyword);
		
		request.setAttribute("circleList", circleList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/circle.jsp");
		
		return forward;
	}
	
}
