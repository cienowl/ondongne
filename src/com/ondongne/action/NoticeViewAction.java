package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.NoticeBean;
import com.ondongne.service.AdminService;

public class NoticeViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		AdminService adminService = new AdminService();
		List<NoticeBean> noticeList = adminService.selectNoticeAll();

		request.setAttribute("noticeList", noticeList);

		ActionForward forward = new ActionForward();
		forward.setPath("notice.jsp");
		
		return forward;

	}	

}
