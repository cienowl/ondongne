package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircleJoin;
import com.ondongne.service.CircleJoinService;

public class CancelJoinCircleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		DataTransferCircleJoin circleBean = new DataTransferCircleJoin();
		circleBean.setJoin_email((String)session.getAttribute("email"));
		circleBean.setJoin_postid(Integer.parseInt(((String)request.getParameter("postid"))));
		
		CircleJoinService circleJoinService = new CircleJoinService();
		boolean cancelSuccess = circleJoinService.cancelJoinCircle(circleBean);
		System.out.println("cancel join circle "+cancelSuccess);
		
		ActionForward forward = null;
		if(!cancelSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('취소실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mypage.ondongne");
		}
		
		return forward;
	}

	
}
