package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessHotplace;
import com.ondongne.dto.HotplaceBean;

public class HotplaceService {
	
	public List<HotplaceBean> selectHotplaceAll() {
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		List<HotplaceBean> hotplaceList = daoHotplace.selectPlaceListAll();
		
		return hotplaceList;
		
	}

}
