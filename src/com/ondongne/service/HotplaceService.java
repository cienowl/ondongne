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
	
	public void getHotplaceScrap() {
//		TODO 스크랩한 핫플레이스 가져오기
	}
	
	public void cancelHotplaceScrap() {
//		TODO 핫플레이스 스크랩 취소
	}

}
