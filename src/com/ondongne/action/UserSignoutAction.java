package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.service.UsersService;

public class UserSignoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = null;

		UsersService userService = new UsersService();
		boolean signoutSuccess = userService.signout();

		if (!signoutSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");			
		} else {			
			session.removeAttribute("email");
			session.removeAttribute("region1");
			session.removeAttribute("region2");
			session.removeAttribute("region3");
			session.invalidate();

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("index.ondongne");
		}

		return forward;
	}

}
