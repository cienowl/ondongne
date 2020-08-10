package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.SellService;

public class DeleteSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		DataTransferSell dtoSell = new DataTransferSell();
		dtoSell.setEmail((String) session.getAttribute("email"));
		dtoSell.setId(Integer.parseInt((String)request.getParameter("postid")));
		
		SellService sellService = new SellService();
		boolean deleteSucces = sellService.deleteSell(dtoSell);
		System.out.println("delete" + deleteSucces);
		
		if (!deleteSucces) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("view.sell");
		}
		
		return forward;
	}

}
