package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.UsersService;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		
		DataTransferUsers dtoUser = new DataTransferUsers();
		dtoUser.setEmail((String) session.getAttribute("email"));
		dtoUser.setPassword(request.getParameter("confirmPassword"));
		
		UsersService userService = new UsersService();
		boolean deleteSuccess = userService.deleteUser(dtoUser);
		
		ActionForward forward = null;
				
		if(!deleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('탈퇴 실패: 비밀번호가 틀렸습니다.')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");
		} else {
			session.removeAttribute("email");
			session.invalidate();
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.ondongne");
		}
		
		return forward;
	}

}
