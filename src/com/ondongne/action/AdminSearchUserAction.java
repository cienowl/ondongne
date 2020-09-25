package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.AdminService;

public class AdminSearchUserAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		if(session.getAttribute("adminId") != null) {
			
			String searchWord = (String) request.getParameter("search");
			//System.out.println(searchWord);
			AdminService adminService = new AdminService();
			
			//검색한 회원 정보 불러오기
			List<DataTransferUsers> searchUserList = adminService.getSearchUser(searchWord);
			request.setAttribute("userList", searchUserList);
			
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
