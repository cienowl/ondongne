package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.dto.NoticeBean;
import com.ondongne.service.AdminService;
import com.ondongne.service.HotplaceService;

public class GetDashboardInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		if (session.getAttribute("adminId") != null) {
			
//			공지사항 리스트 불러오기
			AdminService adminService = new AdminService();			
			List<NoticeBean> noticeList = adminService.selectNoticeAll();			
			request.setAttribute("noticeList", noticeList);
			
//			Hotplace 리스트 불러오기			
			List<HotplaceBean> hotplaceList = adminService.selectHotplaceAll();
			request.setAttribute("hotplaceList", hotplaceList);
			
			forward = new ActionForward();
			forward.setPath("admin_dashboard.jsp");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.admin");		
		}
		
		return forward;
	}

}
