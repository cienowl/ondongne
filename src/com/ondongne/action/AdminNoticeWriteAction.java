package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.NoticeBean;
import com.ondongne.service.AdminService;

public class AdminNoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

//		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeBean noticeBean = new NoticeBean();
		noticeBean.setTitle(title);
		noticeBean.setContent(content);
		
		AdminService adminService = new AdminService();
		boolean writeSuccess = adminService.postNotice(noticeBean);
		
		if (writeSuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../dashboard.admin");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('공지사항 등록 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}	

}
