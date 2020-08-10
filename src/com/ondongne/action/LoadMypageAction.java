package com.ondongne.action;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.action.Action;
import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.CircleService;
import com.ondongne.service.SellService;

public class LoadMypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String sessionEmail = (String) session.getAttribute("email");
		
		ActionForward forward = new ActionForward();;
		
		if (sessionEmail != null) {
//			Avatar 사진 불러오기
			
//			Circle 참여 불러오기
			CircleService circleService = new CircleService();
			List<DataTransferCircle> circleList = circleService.selectJoinCircle(sessionEmail);
			request.setAttribute("circleList", circleList);
			
//			Sell 스크랩 불러오기
			SellService sellService = new SellService();
			List<DataTransferSell> sellList = sellService.selectJoinSell(sessionEmail);
			request.setAttribute("sellList", sellList);
			
//			게시한 Circle Post 불러오기
			 CircleService circlePostService = new CircleService();
			 List<DataTransferCircle> circlePostList = circlePostService.selectPostCircle(sessionEmail);
			 request.setAttribute("postList", circlePostList);
			
			
			
			
			forward.setPath("mypage.jsp");
			
		} else {
			forward.setRedirect(true);
			forward.setPath("index.ondongne");
		}
		
		return forward;
	}
	
}
