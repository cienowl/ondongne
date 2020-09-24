package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.service.AdminService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminHotplaceUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		HttpSession session = request.getSession();
		
		String realFolder = "";
		String saveFolder = "/img/hotplace";
		int fileSize = 5 * 1024 * 1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		String adminId = multi.getParameter("adminId");
		String adminPw = multi.getParameter("adminPw");
		
		HotplaceBean hotplaceBean = new HotplaceBean();
		hotplaceBean.setId(Integer.parseInt(multi.getParameter("postid")));
		hotplaceBean.setAdmin_id(adminId);
		hotplaceBean.setTitle(multi.getParameter("title"));
		hotplaceBean.setPictures(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		hotplaceBean.setZipcode(multi.getParameter("zipcode"));
		hotplaceBean.setAddress(multi.getParameter("address"));
		hotplaceBean.setAddress_detail(multi.getParameter("address_detail"));
		hotplaceBean.setRegion(multi.getParameter("region"));
		hotplaceBean.setDescription(multi.getParameter("description"));
		
		AdminService adminService = new AdminService();
		boolean isUpdateSuccess = adminService.updateHotplace(hotplaceBean, adminId, adminPw);
		
		ActionForward forward = null;
		
		if (!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../hotplace.admin");
		}
		
		return forward;
	}

}
