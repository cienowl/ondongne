package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.NoticeBean;
import com.ondongne.service.AdminService;

public class AdminSearchNoticeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		if (session.getAttribute("adminId") != null) {
			String searchWord = (String) request.getParameter("search");
			AdminService adminService = new AdminService();
			
			// 검색한 공지사항 불러오기
			List<NoticeBean> searchNoticeList = adminService.getSearchNotice(searchWord);
			request.setAttribute("noticeList", searchNoticeList);
			
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
