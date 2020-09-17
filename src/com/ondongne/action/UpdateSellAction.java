package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.SellService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("email");
		
		String realFolder = "";
		String saveFolder = "img/sell";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		ActionForward forward = new ActionForward();
		
		if (loginEmail != null) {
			DataTransferSell dtoSell = new DataTransferSell();
			dtoSell.setId(Integer.parseInt(multi.getParameter("postid")));
			dtoSell.setEmail(loginEmail);
			dtoSell.setTitle(multi.getParameter("title"));
			dtoSell.setIs_parcel(Boolean.parseBoolean(multi.getParameter("sellMethod")));
			dtoSell.setPrice(multi.getParameter("sellPrice"));
			dtoSell.setRegion(multi.getParameter("region"));
			dtoSell.setDescription(multi.getParameter("description"));
			dtoSell.setPictures(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
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
