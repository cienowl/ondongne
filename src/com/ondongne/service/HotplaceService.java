package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessHotplace;
import com.ondongne.dto.HotplaceBean;

public class HotplaceService {
	
	public boolean insertPlace(HotplaceBean dtoHotplaceBean) {
		
		boolean isWriteSuccess = false;
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		int insertCount = daoHotplace.insertPlace(dtoHotplaceBean);

		if (insertCount > 0) isWriteSuccess = true;
		
		return isWriteSuccess;
		
	}
	
	public List<HotplaceBean> selectHotplaceAll() {
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		List<HotplaceBean> hotplaceList = daoHotplace.selectPlaceListAll();
		
		return hotplaceList;
		
	}



}
