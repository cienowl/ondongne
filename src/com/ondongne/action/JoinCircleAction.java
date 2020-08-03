package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircleJoin;
import com.ondongne.service.CircleJoinService;

public class JoinCircleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		DataTransferCircleJoin circleBean = null;
		
		System.out.println((String)session.getAttribute("email"));
		
		circleBean = new DataTransferCircleJoin();
		circleBean.setJoin_email((String)session.getAttribute("email"));
		circleBean.setJoin_postid(Integer.parseInt(request.getParameter("postid")));
		
		CircleJoinService circleJoinService = new CircleJoinService();
		boolean isWriteSuccess = circleJoinService.joinCircle(circleBean);
		System.out.println("소모임등록 "+isWriteSuccess);
		
		// 소모임 참여 실패
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		
		//소모임 참여에 성공하면 mypage에 전체 출력
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("selectjoinpost.circle");
		}
		
		return forward;
	}
	
}