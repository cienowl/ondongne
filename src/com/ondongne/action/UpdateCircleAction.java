package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.service.CircleService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateCircleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		DataTransferCircle circleBean = null;
		String realFolder="";
		String saveFolder = "img/circle";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi=new MultipartRequest(request,realFolder,fileSize,"UTF-8", new DefaultFileRenamePolicy());
		
		circleBean = new DataTransferCircle();
		circleBean.setEmail((String)session.getAttribute("email"));
		circleBean.setId(Integer.parseInt(multi.getParameter("postid")));
		circleBean.setTitle(multi.getParameter("title"));
		circleBean.setPictures(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		circleBean.setRegion(multi.getParameter("region"));
		circleBean.setZipcode(multi.getParameter("zipcode"));
		circleBean.setAddress(multi.getParameter("address"));
		circleBean.setAddress_detail(multi.getParameter("address_detail"));
		circleBean.setEvent_date(multi.getParameter("event_date"));
		circleBean.setEnd_date(multi.getParameter("end_date"));
		circleBean.setGender(multi.getParameter("gender"));
		circleBean.setDescription(multi.getParameter("description"));
		circleBean.setMem_number(multi.getParameter("mem_number"));
		
		CircleService circleService = new CircleService();
		boolean isWriteSuccess = circleService.updateArticle(circleBean);
		System.out.println("update"+isWriteSuccess);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("view.circle");
		}
		
		return forward;
	}
	
}
