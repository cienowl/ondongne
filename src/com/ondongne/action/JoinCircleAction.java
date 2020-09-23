package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.dto.DataTransferCircleJoin;
import com.ondongne.service.CircleJoinService;

public class JoinCircleAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		DataTransferCircleJoin circleBean = new DataTransferCircleJoin();
		circleBean.setJoin_postid(Integer.parseInt(request.getParameter("postid")));
		circleBean.setJoin_email((String)session.getAttribute("email"));
		
		// 참여버튼 누른 소모임의 인원수와 현재 참여한 인원수
		String join_mem_number = request.getParameter("joinmemnumber");
		String mem_number = request.getParameter("memnumber");
		System.out.println("인원 : "+join_mem_number+"/ 현재 참여 인원 : "+mem_number);
		
		// 이미 마감된 소모임일때
		if(join_mem_number.equals(mem_number)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 마감된 소모임 입니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
		
		
			CircleJoinService circleService = new CircleJoinService();
			int joinCount = circleService.checkCircle(circleBean);
	
			// 참여가능한 소모임
			if (joinCount == 0) {	
				boolean isWriteSuccess = circleService.joinCircle(circleBean);
				
				// 소모임 참여 실패
				if (!isWriteSuccess) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('등록실패')");
					out.println("history.back();");
					out.println("</script>");
				} 
				//소모임 참여에 성공하면 해당글 참여인원 update
				else {
					forward = new ActionForward();
					forward.setRedirect(true);
					//forward.setPath("mypage.ondongne");
					forward.setPath("joincount.circle?join_postid="+circleBean.getJoin_postid());
				}
				
			//이미 참여한 소모임
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 참여한 소모임 입니다.')");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		return forward;
	}
	
}
