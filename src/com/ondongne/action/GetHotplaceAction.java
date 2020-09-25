package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.service.HotplaceService;

public class GetHotplaceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
						
		HotplaceService hotplaceService = new HotplaceService();
		List<HotplaceBean> hotplaceList = hotplaceService.selectHotplaceAll();
		
		request.setAttribute("hotplaceList", hotplaceList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("hotplace.jsp");		

		return forward;
	}

}
