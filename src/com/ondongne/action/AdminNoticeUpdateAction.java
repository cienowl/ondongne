package com.ondongne.action;

import java.io.PrintWriter;

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
		ActionForward forward = new ActionForward();

		if (session.getAttribute("adminId") != null) {
			int noticeId = Integer.parseInt(request.getParameter("id"));
			String adminId = request.getParameter("adminId");
			String adminPw = request.getParameter("adminPw");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String author = (String) session.getAttribute("adminId");

			NoticeBean noticeBean = new NoticeBean();
			noticeBean.setId(noticeId);
			noticeBean.setTitle(title);
			noticeBean.setContent(content);
			noticeBean.setAuthor(author);

			AdminService adminService = new AdminService();
			boolean updateSuccess = adminService.updateNotice(noticeBean, adminId, adminPw);
			
			if (updateSuccess) {				
				forward.setRedirect(true);
				forward.setPath("../dashboard.admin");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('공지사항 수정/삭제 실패')");	//에러 메세지 표시
				out.println("history.back();");
				out.println("</script>");
				
//				forward.setRedirect(true);
//				forward.setPath("../dashboard.admin");
			}
		} else {
			forward.setRedirect(true);
			forward.setPath("../index.admin");
		}

		return forward;
	}

}
