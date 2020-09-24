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
	
	public boolean updateSell(DataTransferSell dtoSell) {
		boolean isUpdateSuccess = false;
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		int updateCount = daoSell.updateSellPost(dtoSell);
		
		if (updateCount > 0) isUpdateSuccess = true;
		
		return isUpdateSuccess;
	}
	
	
	public boolean deleteSell(DataTransferSell dtoSell) {
		boolean isDeleteSuccess = false;
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		int deleteCount = daoSell.deleteSellPost(dtoSell);
		
		if (deleteCount > 0) isDeleteSuccess = true;
		
		return isDeleteSuccess;
	}

	public List<DataTransferSell> selectSellAll() {
		DataAccessSell daoSell = DataAccessSell.getInstance();		
		List<DataTransferSell> sellList = daoSell.selectSellAll();		
		
		return sellList;
	}
	
	public List<DataTransferSell> selectJoinSell(String sessionEmail) {
		DataAccessSell daoSell = DataAccessSell.getInstance();
		List<DataTransferSell> joinSellList = daoSell.selectJoinSell(sessionEmail);
		
		return joinSellList;
	}

	public List<DataTransferSell> selectMySell(String sessionEmail) {
		DataAccessSell daoSell = DataAccessSell.getInstance();
		List<DataTransferSell> sellPostList = daoSell.selectMySellList(sessionEmail); 
		
		return sellPostList;
	}
	
	public boolean adminDeleteArticle(int postid) {
		boolean isDeleteSuccess = false;
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		int deleteCount = daoSell.adminDeleteSell(postid);
		
		if(deleteCount>0) {
			isDeleteSuccess=true;
		}
		return isDeleteSuccess;
	}

}
