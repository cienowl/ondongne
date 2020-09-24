package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.AdminService;

public class AdminGetUsersAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		if(session.getAttribute("adminId") != null) {
			
			AdminService adminService = new AdminService();
			
			// 전체 회원정보 불러오기
			List<DataTransferUsers> userList = adminService.getUserAll();
			request.setAttribute("userList", userList);
			
			forward = new ActionForward();
			forward.setPath("admin_users.jsp");
			
		}else {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.admin");
			
		}
		return forward;
	}

}
