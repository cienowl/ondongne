package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.service.AdminService;

public class AdminSignoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		AdminService adminService = new AdminService();
		boolean signoutSuccess = adminService.signout();
		
		if (signoutSuccess) {
			session.removeAttribute("adminId");
			session.invalidate();
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.admin");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}	

}
