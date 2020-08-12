package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.service.HotplaceService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertHotplaceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		HttpSession session = request.getSession();

		String realFolder = "";
		String saveFolder = "/img/hotplace/storepics";
		int fileSize = 5 * 1024 * 1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		HotplaceBean hotplaceBean = new HotplaceBean();
		hotplaceBean.setAdmin_id("admin");
		hotplaceBean.setTitle(multi.getParameter("title"));
//		placeBean.setPicture(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		hotplaceBean.setPictures("pictures");
		hotplaceBean.setZipcode(multi.getParameter("zipcode"));
		hotplaceBean.setAddress(multi.getParameter("address"));
		hotplaceBean.setAddress_detail(multi.getParameter("address_detail"));
		hotplaceBean.setRegion(multi.getParameter("region"));
		hotplaceBean.setDescription(multi.getParameter("description"));
		//placeBean.setTags(multi.getParameter("tags"));
		hotplaceBean.setTags("tags");
		
		HotplaceService insertplaceService = new HotplaceService();
		boolean isWriteSuccess = insertplaceService.insertPlace(hotplaceBean);
		
		ActionForward forward = null;
		
		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록 실패')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("dashboard.admin");
		}

		return forward;
	}
}
