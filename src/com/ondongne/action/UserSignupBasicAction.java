package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.UsersService;

public class UserSignupBasicAction extends HttpServlet implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		DataTransferUsers dtoUser = new DataTransferUsers();
		dtoUser.setEmail((String) request.getParameter("signupEmail"));
		dtoUser.setPassword(request.getParameter("signupPassword1"));
		dtoUser.setName(request.getParameter("signupName"));
		dtoUser.setPhone(request.getParameter("signupPhone"));
		
		UsersService usersService = new UsersService();
		boolean isWriteSuccess = usersService.signupBasic(dtoUser);
		
		ActionForward forward = null;
		
		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('가입 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();	//ActionForward() 객체 생성
			forward.setRedirect(true);		//setRedirect 값을 true로 지정
			forward.setPath("index.ondongne");	//글쓰기 성공시 boardList.bo로 이동
		}

		return forward;
	}

}
