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

public class PostSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		
		String realFolder = "";
		String saveFolder = "img/sell";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		DataTransferSell dtoSell = new DataTransferSell();
		dtoSell.setEmail((String)session.getAttribute("email"));
		dtoSell.setTitle(multi.getParameter("title"));
		dtoSell.setIs_parcel(Boolean.parseBoolean(multi.getParameter("sellMethod")));
		dtoSell.setPrice(multi.getParameter("sellPrice"));
		dtoSell.setRegion(multi.getParameter("region"));
		dtoSell.setDescription(multi.getParameter("description"));
		dtoSell.setPictures(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		dtoSell.setIs_active(true);

		SellService sellService = new SellService();
		boolean isWriteSuccess = sellService.postSell(dtoSell);	//dtoSell 들고 글등록해주는 서비스로 이동

		ActionForward forward = null;
		
		if (!isWriteSuccess) {		//sql 문 실패시
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();	//ActionForward() 객체 생성
			forward.setRedirect(true);		//setRedirect 값을 true로 지정
			forward.setPath("view.sell");	//글쓰기 성공시 boardList.bo로 이동
		}

		return forward;	//forward 객체 리턴
		
	}	

}