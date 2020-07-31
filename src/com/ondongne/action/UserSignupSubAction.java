package com.ondongne.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ondongne.dto.ActionForward;
import com.ondongne.dto.DataTransferUsers;
import com.ondongne.service.UsersService;

public class UserSignupSubAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		
		String sessionEmail = (String) session.getAttribute("email");
		String email = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword1");
		String phone = request.getParameter("inputPhone");
		String birthday = request.getParameter("inputBirthday");
		String gender = request.getParameter("inputGender");
		String nickname = request.getParameter("inputNickname");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("roadAddress");
		String address_detail = request.getParameter("detailAddress");
		String region1 = request.getParameter("inputRegion1");
		String region2 = request.getParameter("inputRegion2");
		String region3 = request.getParameter("inputRegion3");

		DataTransferUsers dtoUser = new DataTransferUsers();
		dtoUser.setSessionEmail(sessionEmail);
		dtoUser.setEmail(email);
		dtoUser.setPassword(password);
		dtoUser.setPhone(phone);
		dtoUser.setBirthday(birthday);
		dtoUser.setGender(gender);
		dtoUser.setNickname(nickname);
		dtoUser.setZipcode(zipcode);
		dtoUser.setAddress(address);
		dtoUser.setAddress_detail(address_detail);
		dtoUser.setRegion1(region1);
		dtoUser.setRegion2(region2);
		dtoUser.setRegion3(region3);
		
		UsersService userService = new UsersService();
		boolean isUpdateSuccess = userService.signupSub(dtoUser);
		
		ActionForward forward = null;
		
		if (!isUpdateSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('추가정보 입력 실패')");	//에러 메세지 표시
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();	//ActionForward() 객체 생성
			forward.setRedirect(true);		//setRedirect 값을 true로 지정
			forward.setPath("mypage.ondongne");	//글쓰기 성공시 boardList.bo로 이동
		}

		return forward;
	}

}