package com.ondongne.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.NoticeBean;
import com.ondongne.service.AdminService;

public class AdminNoticeUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = null;

		if (session.getAttribute("adminId") != null) {
			int noticeId = Integer.parseInt(request.getParameter("id"));
			String adminId = request.getParameter("adminId");
			String adminPw = request.getParameter("adminPw");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			NoticeBean noticeBean = new NoticeBean();
			noticeBean.setId(noticeId);
			noticeBean.setTitle(title);
			noticeBean.setContent(content);

			AdminService adminService = new AdminService();
			boolean updateSuccess = adminService.updateNotice(noticeBean, adminId, adminPw);

			if (updateSuccess) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("../dashboard.admin");
			}
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../index.admin");
		}

		return null;
	}

}
