package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.UsersService;

public class UserLostEmail implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		DataTransferUsers userBean = null;
		
		userBean = new DataTransferUsers();
		userBean.setName(request.getParameter("name"));
		userBean.setPhone(request.getParameter("phone"));
		
		UsersService userService = new UsersService();
		String email = userService.findEmail(userBean);
		//System.out.println(email);
		
		if(email==null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('가입되지 않은 회원입니다.')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			request.setAttribute("findEmail", email);
			forward = new ActionForward();
			forward.setPath("lostidResult.jsp");
		}
		
		return forward;
	}
	
}
