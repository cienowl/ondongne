package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessHotplace;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.dto.ScrapPlaceBean;

public class HotplaceService {
	
	public List<HotplaceBean> selectHotplaceAll() {
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		List<HotplaceBean> hotplaceList = daoHotplace.listCardHotplace();
		
		return hotplaceList;
		
	}
	
	public boolean setHotplaceScrap(ScrapPlaceBean scrapBean) throws Exception {
//		TODO 핫플레이스 스크랩
		boolean isWriteSuccess = false;
		
		DataAccessHotplace hotplaceDAO = DataAccessHotplace.getInstance();
		int insertCount = hotplaceDAO.scrapPlaceInsert(scrapBean);
		
		if(insertCount>0) 
			isWriteSuccess = true;
		
		return isWriteSuccess;
		
	}

	public List<HotplaceBean> selectScrapPlace(String userID) {
		// TODO Auto-generated method stub 스크랩리스트 마이페이지에 출력
		
		DataAccessHotplace daoPlace = DataAccessHotplace.getInstance();
		List<HotplaceBean> scrapPlace = daoPlace.selectscrapPlace(userID);
		
		return scrapPlace;
	}

	public boolean cancelScrapPlace(ScrapPlaceBean scrapBean) {
		// TODO Auto-generated method stub 마이페이지에서 스크랩 취소
		
		boolean cancelSuccess = false;
		
		DataAccessHotplace daoplace = DataAccessHotplace.getInstance();
		int deleteCount = daoplace.scrapPlaceCancle(scrapBean);
		
		if(deleteCount > 0) {
			cancelSuccess = true;
		}
		
		return cancelSuccess;
	}

}
