package com.ondongne.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.service.AdminService;

public class AdminSearchHotplaceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		if(session.getAttribute("adminId") != null) {
			
			String searchWord = (String) request.getParameter("search");
			AdminService adminService = new AdminService();
			
			// 검색한 hotplace 게시물 불러오기
			List<HotplaceBean> searchHotplaceList = adminService.getSearchHotplace(searchWord);
			request.setAttribute("hotplaceList", searchHotplaceList);
			
			forward = new ActionForward();
			forward.setPath("admin_hotplace.jsp");
		
		}else {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.admin");
		
		}
		
		return forward;
	}

}
