package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.service.AdminService;

public class AdminNoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = null;

		if (session.getAttribute("adminId") != null) {
			String noticeId = request.getParameter("id");
			String adminId = request.getParameter("adminId");
			String adminPw = request.getParameter("adminPw");

			AdminService adminService = new AdminService();
			boolean deleteSuccess = adminService.deleteNoticeOne(noticeId, adminId, adminPw);

			forward = new ActionForward();

			if (deleteSuccess) {				
				forward.setRedirect(true);
				forward.setPath("../dashboard.admin");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('공지사항 수정/삭제 실패')");	//에러 메세지 표시
				out.println("history.back();");
				out.println("</script>");

				forward.setRedirect(true);
				forward.setPath("../dashboard.admin");
			}
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../index.admin");
		}

		return forward;
	}

}
