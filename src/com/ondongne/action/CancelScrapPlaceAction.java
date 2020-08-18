package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.ScrapPlaceBean;
import com.ondongne.service.HotplaceService;

public class CancelScrapPlaceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		ScrapPlaceBean scrapBean = new ScrapPlaceBean();
		scrapBean.setScrap_email((String)session.getAttribute("email"));
		scrapBean.setScrap_id(Integer.parseInt((String)request.getParameter("scrap_id")));
		
		HotplaceService hotplaceSVC = new HotplaceService();
		boolean cancelSuccess = hotplaceSVC.cancelScrapPlace(scrapBean);
		System.out.println("cancel scrapPlace" + cancelSuccess);
		
		ActionForward forward = null;
		if(!cancelSuccess) {
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
