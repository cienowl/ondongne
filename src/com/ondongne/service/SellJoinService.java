package com.ondongne.service;

import com.ondongne.dao.DataAccessSellJoin;
import com.ondongne.dto.DataTransferSellJoin;

public class SellJoinService {

	public boolean insertScrap(DataTransferSellJoin scrapBean) {

		boolean isWriteSuccess = false;

		DataAccessSellJoin daoSellJoin = DataAccessSellJoin.getInstance();
		int insertCount = daoSellJoin.joinSellInsert(scrapBean);

		if (insertCount > 0) {
			isWriteSuccess = true;
		}

		return isWriteSuccess;
	}
	
	public boolean cancelScrap(DataTransferSellJoin scrapBean) {
		
		boolean isDeleteSuccess = false;
		
		DataAccessSellJoin daoJoinSell = DataAccessSellJoin.getInstance();
		int deleteCount = daoJoinSell.deleteSellJoin(scrapBean);
		
		if (deleteCount > 0) isDeleteSuccess = true;
		
		return isDeleteSuccess;
		
	}

	public int checkScrap(DataTransferSellJoin scrapBean) {

		DataAccessSellJoin daoSellJoin = DataAccessSellJoin.getInstance();
		int joinCount = daoSellJoin.joinSellCheck(scrapBean);

		return joinCount;
	}

}
