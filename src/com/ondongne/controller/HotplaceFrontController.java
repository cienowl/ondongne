package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.CancelScrapPlaceAction;
import com.ondongne.action.GetHotplaceAction;
import com.ondongne.action.LoadMypageAction;
import com.ondongne.action.ScrapPlaceAction;
import com.ondongne.dto.ActionForward;

@WebServlet("*.hotplace")
public class HotplaceFrontController extends javax.servlet.http.HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/view.hotplace")) {
//			핫플레이스 모달 출력 페이지
			action = new GetHotplaceAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/scrap.hotplace")) {
			//핫플레이스 스크랩
			action = new ScrapPlaceAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/togoListPlace.hotplace")) {
			//스크랩리스트 마이페이지에 출력
			action = new LoadMypageAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/cancelPlace.hotplace")) {
			//스크랩리스트에서 삭제
			action = new CancelScrapPlaceAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
