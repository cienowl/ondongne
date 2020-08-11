package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircleJoin;
import com.ondongne.service.CircleJoinService;

public class JoinCircleAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		DataTransferCircleJoin circleBean = null;

		circleBean = new DataTransferCircleJoin();
		circleBean.setJoin_postid(Integer.parseInt(request.getParameter("postid")));
		circleBean.setJoin_email((String)session.getAttribute("email"));

		CircleJoinService circleService = new CircleJoinService();
		int joinCount = circleService.checkCircle(circleBean);

		// 참여가능한 소모임
		if (joinCount == 0) {
	
//			CircleJoinService circleJoinService = new CircleJoinService();
			boolean isWriteSuccess = circleService.joinCircle(circleBean);
			System.out.println("소모임등록"+isWriteSuccess);
			
			// 소모임 참여 실패
			if (!isWriteSuccess) {
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
				forward.setPath("mypage.ondongne");
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
		return forward;
	}

}
