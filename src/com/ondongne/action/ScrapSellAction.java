package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSellJoin;
import com.ondongne.service.SellJoinService;
import com.ondongne.service.SellService;

public class ScrapSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		DataTransferSellJoin scrapBean = new DataTransferSellJoin();
		scrapBean.setJoin_postid(Integer.parseInt(request.getParameter("postid")));
		scrapBean.setJoin_email((String) session.getAttribute("email"));
		
		SellJoinService sellJoinService = new SellJoinService();
		int joinCount = sellJoinService.checkScrap(scrapBean);
		
		if (joinCount == 0) {
			
//			SellJoinService sellJoinService = new SellJoinService();
			boolean isWriteSuccess = sellJoinService.insertScrap(scrapBean);
					
			if (!isWriteSuccess) {
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
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 스크랩한 판매글 입니다.')");
			out.println("history.back();");
			out.println("</script>");
		}

		return forward;
	}

}
