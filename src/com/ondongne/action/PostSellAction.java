package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.SellService;

public class PostSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		DataTransferSell dtoSell = new DataTransferSell();
		
		dtoSell.setEmail((String)session.getAttribute("email"));
		dtoSell.setTitle(request.getParameter("title"));
		dtoSell.setIs_auction(request.getParameter("isAuction"));
		dtoSell.setSell_method(request.getParameter("sellMethod"));
		dtoSell.setStarting_price(request.getParameter("sellPrice"));	//시작가 또는 판매가
		dtoSell.setEnd_date(request.getParameter("end_date"));
		dtoSell.setEnd_time(request.getParameter("end_time"));
		dtoSell.setRegion(request.getParameter("region"));
		dtoSell.setDescription(request.getParameter("description"));
//		dtoSell.setPictures(request.getParameter("pictures")); TODO: 파일 경로 가져오기 구현
		dtoSell.setPictures("picture_filename");
//		dtoSell.setTags(request.getParameter("tags"));	TODO: tags 내용 가져오기
		dtoSell.setTags("tags");
		
		SellService sellService = new SellService();
		boolean isWriteSuccess = sellService.postSell(dtoSell);	//dtoSell 들고 글등록해주는 서비스로 이동
				
		System.out.println("sellPost" + isWriteSuccess);	//sql 처리 성공여부 프린트 (true or false)
		
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
