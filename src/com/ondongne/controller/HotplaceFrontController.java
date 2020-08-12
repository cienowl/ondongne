package com.ondongne.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ondongne.action.Action;
import com.ondongne.action.GetHotplaceAction;
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
//			핫플레이스 출력 페이지
			action = new GetHotplaceAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

//		else if (command.equals("/hotplaceListForm.hotplace")) {
//			//System.out.println("success");
//			action = new ContentListAction();
//			try {
//				forward = action.execute(request, response);
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//	
//		else if (command.equals("/hotplaceDetailForm.hotplace")) {
//			//System.out.println("get");
//			action = new DetailPlaceProAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} else if(command.equals("/hotplaceModifyForm.hotplace")) {
//			action = new ModifyPlaceFormAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} 
//		else if(command.equals("/hotplaceUpdatePro.hotplace")) {
//			System.out.println("success");
//			action = new ModifyPlaceProAction();
//			try {
//				forward = action.execute(request, response);
//				System.out.println("suc :"+ forward);
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/hotplaceDeletePro.hotplace")) {
//			System.out.println("plz");
//			String a = request.getParameter("id");
//			System.out.println("����:"+request.getParameter("id"));
//			request.setAttribute("id", a);
//			action = new DeletePlaceProAction();
//			try {
//				forward = action.execute(request, response);
//				System.out.println("ee : " + forward.getPath());
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/hotplaceShowPro.hotplace")) {
//			System.out.println("show start");
////			String a = request.getParameter("email");
////			System.out.println("ID : " + a);
////			request.setAttribute("email", a);
//			action = new ShowPlaceProAction();
//			try {
//				forward = action.execute(request, response);
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//		else if(command.equals("/searchPlaceForm.hotplace")) {
//			System.out.println("search Start");
//			String searchRegion =request.getParameter("searchRegion");
//			System.out.println("searchRegion : "+searchRegion);
//			action = new SearchPlaceForm();
//			try {
//				forward = action.execute(request, response);
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//			
//		}
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
