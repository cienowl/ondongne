package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleJoinService;
import com.ondongne.service.CircleService;

public class JoinCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		
		int join_postid = Integer.parseInt(request.getParameter("join_postid"));
		System.out.println("참여버튼 누른 게시물 글번호 : "+join_postid);
		
		CircleJoinService joinCircleService = new CircleJoinService();
		int joinCount = joinCircleService.joinCountMem(join_postid);
		String join_mem_number = Integer.toString(joinCount);
		
		// 해당하는 글의 join_mem_number을 update해주기
		DataTransferCircle circleBean = new DataTransferCircle();
		circleBean.setId(join_postid);
		circleBean.setJoin_mem_number(join_mem_number);
		
		CircleService circleService = new CircleService();
		boolean isWriteSuccess = circleService.updateJoinMem(circleBean);
		System.out.println("참여인원 update : "+isWriteSuccess);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
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
