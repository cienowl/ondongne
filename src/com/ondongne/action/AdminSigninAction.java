package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.AdminBean;
import com.ondongne.service.AdminService;

public class AdminSigninAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		String id = request.getParameter("adminId");
		String password = request.getParameter("adminPassword");
		
		if (id == null || password == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.admin");
		} else {
			AdminBean adminBean = new AdminBean();
			adminBean.setAdminId(id);
			adminBean.setAdminPassword(password);
			
			AdminService adminService = new AdminService();
			boolean signinSuccess = adminService.signin(adminBean);
			
			if (signinSuccess) {
				session.setAttribute("adminId", id);
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("dashboard.admin");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 실패')");	//에러 메세지 표시
				out.println("history.back();");
				out.println("</script>");
			}
		}		
		
		return forward;
	}	
	
}
