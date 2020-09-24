package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.UsersService;

public class UserSigninAction extends HttpServlet implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = null;
		DataTransferUsers userBean = null;
		Cookie cookie = null;
		
		
//		입력받은 이메일과 비밀번호를 userBean에 set
		userBean = new DataTransferUsers();
		userBean.setEmail(request.getParameter("signinEmail"));
		userBean.setPassword(request.getParameter("signinPassword"));
//		System.out.println(request.getParameter("signinEmail"));
//		쿠키체크박스 -> 체크되면 true 체크되지 않으면 null
		String storeEmail = request.getParameter("storeEmail");
//		System.out.println(storeEmail);
		
//		service 패키지
		UsersService userService = new UsersService();
		userBean = userService.checkUser(userBean);
//		System.out.println("login "+userSuccess);
		
//		로그인 실패시
//		TODO: 이슈)로그인실패시 index페이지로 넘어가고 입력했던 email 뜸 
		if(userBean == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		
//		로그인 성공시
		else {
			if(storeEmail != null && storeEmail.trim().equals("true")) {
				cookie = new Cookie("cookieEmail",userBean.getEmail());
				response.addCookie(cookie);
			}
			else {
				cookie = new Cookie("cookieEmail",null);
				response.addCookie(cookie);
			}
			
			session.setAttribute("email", userBean.getEmail());
			session.setAttribute("region1", userBean.getRegion1());
			session.setAttribute("region2", userBean.getRegion2());
			session.setAttribute("region3", userBean.getRegion3());
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("mypage.ondongne");
		}
		
		return forward;
	}
	
}
