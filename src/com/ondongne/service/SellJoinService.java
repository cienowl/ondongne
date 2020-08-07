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

	public int checkScrap(DataTransferSellJoin scrapBean) {

		DataAccessSellJoin daoSellJoin = DataAccessSellJoin.getInstance();
		int joinCount = daoSellJoin.joinSellCheck(scrapBean);

		return joinCount;
	}

}
