package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessHotplace;
import com.ondongne.dto.HotplaceBean;

public class HotplaceService {
	
	public List<HotplaceBean> selectHotplaceAll() {
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		List<HotplaceBean> hotplaceList = daoHotplace.listCardHotplace();
		
		return hotplaceList;
		
	}
	
	public void setHotplaceScrap() {
//		TODO 핫플레이스 스크랩
	}
	
	public void getHotplaceScrap() {
//		TODO 스크랩한 핫플레이스 가져오기
	}
	
	public void cancelHotplaceScrap() {
//		TODO 핫플레이스 스크랩 취소
	}

}
