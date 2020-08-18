package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.dto.ScrapPlaceBean;
import com.ondongne.service.HotplaceService;

public class ScrapPlaceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();

		ScrapPlaceBean scrapBean = new ScrapPlaceBean();
		scrapBean.setScrap_id(Integer.parseInt(request.getParameter("postid")));
		scrapBean.setScrap_email((String) session.getAttribute("email"));
		
		HotplaceService hotplaceSvc = new HotplaceService();
		boolean isWriteSuccess = hotplaceSvc.setHotplaceScrap(scrapBean);
		
		//스크랩실패
		if(!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");				
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mypage.ondongne");
		}
		
		
		return forward;
	}

}
