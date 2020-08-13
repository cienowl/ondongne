package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.service.AdminService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminHotplaceDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String realFolder = "";
		String saveFolder = "/img/hotplace/storepics";
		int fileSize = 5 * 1024 * 1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		String adminId = multi.getParameter("adminId");
		String adminPw = multi.getParameter("adminPw");
		String hotplaceId = multi.getParameter("postid");
		
		AdminService adminService = new AdminService();
		boolean isDeleteSuccess = adminService.deleteHotplaceOne(hotplaceId, adminId, adminPw);
		
		ActionForward forward = null;
		
		if (!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("../dongneposts.admin");
		}
		
		return forward;
	}

}
