package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.UsersService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserAvatarSetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String loginEmail = (String) session.getAttribute("email");
		String realFolder = "";
		String saveFolder = "img/avatar";
		int fileSize = 5*1024*1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		DataTransferUsers dtoUser = new DataTransferUsers();
		dtoUser.setEmail(loginEmail);
		dtoUser.setProfile_picture(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		
		UsersService userService = new UsersService();
		boolean isUpdateSuccess = userService.setAvatar(dtoUser);
		
		ActionForward forward = null;
		
		if (!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아바타 업로드 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");			
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mypage.ondongne");
		}
		
		return forward;
	}
	
}
