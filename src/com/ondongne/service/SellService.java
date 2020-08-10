package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessSell;
import com.ondongne.dto.DataTransferSell;

public class SellService {
	
	public boolean postSell(DataTransferSell dtoSell) {

		boolean isWriteSuccess = false;
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		int insertCount = daoSell.insertSellPost(dtoSell);	//mybatis 쿼리 실행후 리턴으로 성공 줄수 확인
		
		if (insertCount > 0) isWriteSuccess = true;	//sql 문이 정상적으로 실행되었으면
		
		return isWriteSuccess;
		
	}

	public List<DataTransferSell> selectSellAll() {
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		
		List<DataTransferSell> sellList = daoSell.selectSellAll();		
		
		return sellList;
		
	}
	
	public List<DataTransferSell> selectJoinSell(String sessionEmail) {
//		TODO: 구현 필요
		List<DataTransferSell> sellList = null;
		
		
		return sellList;
		
	}
	
	public void selectSellOne() {
//		TODO: 한개 내용만 가져오기
	}
	
	public boolean deleteSell(DataTransferSell dtoSell) {
		
		boolean isDeleteSuccess = false;
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		int deleteCount = daoSell.deleteSellPost(dtoSell);
		
		if (deleteCount > 0) isDeleteSuccess = true;
		
		return isDeleteSuccess;
	}
	

}
