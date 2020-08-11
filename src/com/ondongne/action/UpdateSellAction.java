package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.SellService;

public class UpdateSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("email");
		
		ActionForward forward = new ActionForward();
		
		if (loginEmail != null) {
			DataTransferSell dtoSell = new DataTransferSell();
			dtoSell.setId(Integer.parseInt(request.getParameter("postid")));
			dtoSell.setEmail((String)session.getAttribute("email"));
			dtoSell.setTitle(request.getParameter("title"));
			dtoSell.setIs_parcel(Boolean.parseBoolean(request.getParameter("sellMethod")));
			dtoSell.setPrice(request.getParameter("sellPrice"));	//시작가 또는 판매가
			dtoSell.setRegion(request.getParameter("region"));
			dtoSell.setDescription(request.getParameter("description"));
//			dtoSell.setPictures(request.getParameter("pictures")); TODO: 파일 경로 가져오기 구현
			dtoSell.setPictures("picture_filename");
//			dtoSell.setTags(request.getParameter("tags"));	TODO: tags 내용 가져오기
			dtoSell.setTags("tags");
			dtoSell.setIs_active(true);
			
			SellService sellService = new SellService();
			boolean isUpdateSuccess = sellService.updateSell(dtoSell);
			
			if (!isUpdateSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back();");
				out.println("</script>");
			} else {
				forward.setRedirect(true);
				forward.setPath("mypage.ondongne");
			}
		} else {
			forward.setRedirect(true);
			forward.setPath("index.ondongne");
		}

		return forward;
	}

}
