package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.service.SellService;

public class AdminDeleteSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		int postid = Integer.parseInt((String)request.getParameter("postid"));
		
		SellService sellService = new SellService();
		boolean deleteSuccess = sellService.adminDeleteArticle(postid);
		System.out.println("delete "+deleteSuccess);
		
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
			forward.setPath("sell.admin");
		}
		
		return forward;
	}
	
}
