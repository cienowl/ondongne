package com.ondongne.service;

import com.ondongne.dto.AdminBean;

public class AdminService {
	
//	Admin ID and Password
    final String ADMIN_ID = "admin";
    final String ADMIN_PASSWORD = "1111";
	
	public boolean signin(AdminBean adminBean) {
//		Admin 정보는 DB에 관리하지 않으므로 DB ACCESS가 없음 SERVICE에서 결과 처리함
		boolean signinSuccess = false;
		
	    if (adminBean.getAdminId().equals(ADMIN_ID) && adminBean.getAdminPassword().equals(ADMIN_PASSWORD)) {
	    	signinSuccess = true;
	    }
	    
		return signinSuccess;
	}
	
	public boolean signout() {
				
		return true;		
	}

}
