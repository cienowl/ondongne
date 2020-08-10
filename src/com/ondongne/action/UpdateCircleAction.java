package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;

public class UpdateCircleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		DataTransferCircle circleBean = null;
		
		circleBean = new DataTransferCircle();
		circleBean.setEmail((String)session.getAttribute("email"));
		circleBean.setId(Integer.parseInt(request.getParameter("postid")));
		circleBean.setTitle(request.getParameter("title"));
		circleBean.setRegion(request.getParameter("region"));
		circleBean.setZipcode(request.getParameter("zipcode"));
		circleBean.setAddress(request.getParameter("address"));
		circleBean.setAddress_detail(request.getParameter("address_detail"));
		circleBean.setEvent_date(request.getParameter("event_date"));
		circleBean.setEnd_date(request.getParameter("end_date"));
		circleBean.setGender(request.getParameter("gender"));
		circleBean.setDescription(request.getParameter("description"));
		circleBean.setMem_number(request.getParameter("mem_number"));
		
		CircleService circleService = new CircleService();
		boolean isWriteSuccess = circleService.updateArticle(circleBean);
		System.out.println("update"+isWriteSuccess);
		
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
			forward.setPath("view.circle");
		}
		
		return forward;
	}
	
}
