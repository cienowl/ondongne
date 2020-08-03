package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.service.SellService;

public class GetSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		HttpSession session = request.getSession();
		
//		DataTransferSell dtoSell = new DataTransferSell();
		
		SellService sellService = new SellService();
		List<DataTransferSell> sellList = sellService.selectSellAll();	//DB내용 전부 긁어오기
		
		request.setAttribute("sellList", sellList);	//request 에 sellList 객체 추가		
		
		ActionForward forward = new ActionForward();	//ActionFoward 객체 생성
		forward.setRedirect(true);
   		forward.setPath("sell.jsp");		//sell.jsp 로 이동
		
		return forward;
	}

	
}
