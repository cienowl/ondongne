package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.AdminDeleteCircleAction;
import com.ondongne.action.AdminDeleteSellAction;
import com.ondongne.action.AdminGetCircleInfoAction;
import com.ondongne.action.AdminHotplaceDeleteAction;
import com.ondongne.action.AdminNoticeDeleteAction;
import com.ondongne.action.AdminNoticeUpdateAction;
import com.ondongne.action.AdminNoticeWriteAction;
import com.ondongne.action.AdminSearchCircleAction;
import com.ondongne.action.AdminSearchSellAction;
import com.ondongne.action.AdminSigninAction;
import com.ondongne.action.AdminSignoutAction;
import com.ondongne.action.AdminGetDashboardInfoAction;
import com.ondongne.action.AdminGetDongneInfoAction;
import com.ondongne.action.AdminGetSellInfoAction;
import com.ondongne.action.AdminHotplaceInsertAction;
import com.ondongne.action.AdminHotplaceUpdateAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.admin")
public class AdminFrontController extends HttpServlet {
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
	
		if (command.equals("/index.admin")) {
//			footer 에서 admin 버튼 누르면 admin_index.html 로 이동
			forward = new ActionForward();
			forward.setPath("/admin_index.jsp");
		}

		else if (command.equals("/signin.admin")) {
//			TODO: RSA 암호화 필요
//			admin 페이지 로그인 action
			action = new AdminSigninAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/signout.admin")) {
//			admin 페이지 로그아웃 action
			action = new AdminSignoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/dashboard.admin")) {
//			dashboard로 이동
			action = new AdminGetDashboardInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		
		else if (command.equals("/hotplace.admin")) {
//			hotplace 관리페이지 로드
			action = new AdminGetDongneInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		else if (command.equals("/circle.admin")) {
//			Circle 관리페이지 로드
			action = new AdminGetCircleInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		else if(command.equals("/circlePostDelete.admin")) {
//			관리자 페이지에서 소모임 게시물 삭제
			action = new AdminDeleteCircleAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/searchCircle.admin")) {
//			관리자 페이지에서 소모임 게시물 검색
			action = new AdminSearchCircleAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/sell.admin")) {
//			Sell 관리페이지 로드
			action = new AdminGetSellInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}	
		
		else if(command.equals("/sellPostDelete.admin")) {
//			관리자 페이지에서 판매 게시물 삭제
			action = new AdminDeleteSellAction();
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/searchSell.admin")) {
//			관리자 페이지에서 판매 게시물 검색
			action = new AdminSearchSellAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/notice/write.admin")) {
//			공지사항 작성
			action = new AdminNoticeWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/notice/delete.admin")) {
//			공지사항 삭제
			action = new AdminNoticeDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		
		else if (command.equals("/notice/update.admin")) {
//		공지사항 수정
			action = new AdminNoticeUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/hotplace/write.admin")) {
//			Hotplace 장소 등록
			action = new AdminHotplaceInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/hotplace/delete.admin")) {
//			hotplace 장소 삭제
			action = new AdminHotplaceDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		
		else if (command.equals("/hotplace/update.admin")) {
//			hotplace 장소 수정
			action = new AdminHotplaceUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		if (forward != null) {		//forward 내 값이 있으면
			if (forward.isRedirect()) {		//forward의 isRedirect() 값이 true 면
				response.sendRedirect(forward.getPath());	//forward객체에 새로 setting 된 경로로 이동, sendRedirect는 get, post 방식이 아니기때문에 @WebServlet 항목으로 결정
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());	//기존 path로 이동
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	//action method 가 get 인 경우 doProcess 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}  	
	
	//action method 가 post 인 경우 doProcess 실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}   

}
