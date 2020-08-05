package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;

public class DeleteCircleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		DataTransferCircle circleDto= new DataTransferCircle();
		circleDto.setEmail((String)session.getAttribute("email"));
		circleDto.setId(Integer.parseInt(((String)request.getParameter("postid"))));
		
		CircleService circleService = new CircleService();
		boolean deleteSuccess = circleService.deleteArticle(circleDto);
		System.out.println("delete"+deleteSuccess);
		
		if(!deleteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
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
