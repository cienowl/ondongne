package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.NoticeBean;
import com.ondongne.service.AdminService;

public class GetDashboardInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
//		HttpSession session = request.getSession();
		
		AdminService adminService = new AdminService();
		List<NoticeBean> noticeList = adminService.selectNoticeAll();
		
		request.setAttribute("noticeList", noticeList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("/admin_dashboard.jsp");		

		return forward;
	}

}
