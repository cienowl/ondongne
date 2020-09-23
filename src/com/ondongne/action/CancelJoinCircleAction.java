package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.dto.DataTransferCircleJoin;
import com.ondongne.service.CircleJoinService;
import com.ondongne.service.CircleService;

public class CancelJoinCircleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		DataTransferCircleJoin circleBean = new DataTransferCircleJoin();
		circleBean.setJoin_email((String)session.getAttribute("email"));
		circleBean.setJoin_postid(Integer.parseInt(((String)request.getParameter("postid"))));
		
		CircleJoinService circleJoinService = new CircleJoinService();
		boolean cancelSuccess = circleJoinService.cancelJoinCircle(circleBean);
		
		System.out.println("cancel join circle "+cancelSuccess);
		
		
		if(!cancelSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('취소실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			
			// 해당하는 글의 join_mem_number을 update
			DataTransferCircle circleBean2 = new DataTransferCircle();
			int joinCount = circleJoinService.joinCountMem(circleBean.getJoin_postid());
			String join_mem_number = Integer.toString(joinCount);
			circleBean2.setJoin_mem_number(join_mem_number);
			circleBean2.setId(circleBean.getJoin_postid());
			
			CircleService circleService = new CircleService();
			boolean isWriteSuccess = circleService.updateJoinMem(circleBean2);
			if(!isWriteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패')");
				out.println("history.back();");
				out.println("</script>");
			}
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mypage.ondongne");
		}
		
		return forward;
	}

	
}
