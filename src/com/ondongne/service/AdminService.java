package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessHotplace;
import com.ondongne.dao.DataAccessNotice;
import com.ondongne.dto.AdminBean;
import com.ondongne.dto.HotplaceBean;
import com.ondongne.dto.NoticeBean;

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

	public boolean postNotice(NoticeBean noticeBean) {

		boolean writeSuccess = false;

		DataAccessNotice daoNotice = DataAccessNotice.getinstance();
		int insertCount = daoNotice.insertNotice(noticeBean);

		if (insertCount > 0) writeSuccess = true;

		return writeSuccess;

	}

	public List<NoticeBean> selectNoticeAll() {

		DataAccessNotice daoNotice = DataAccessNotice.getinstance();

		List<NoticeBean> noticeList = daoNotice.selectNoticeAll();

		return noticeList;

	}

	public boolean updateNotice(NoticeBean noticeBean, String adminId, String adminPw) {

		boolean updateSuccess = false;

		if (adminId.equals(ADMIN_ID) && adminPw.equals(ADMIN_PASSWORD)) {
			DataAccessNotice daoNotice = DataAccessNotice.getinstance();
			int updateCount = daoNotice.updateNotice(noticeBean);

			if (updateCount > 0) updateSuccess = true;
	    }		

		return updateSuccess;
	}

	public boolean deleteNoticeOne(String noticeId, String adminId, String adminPw) {

		boolean deleteSuccess = false;

		if (adminId.equals(ADMIN_ID) && adminPw.equals(ADMIN_PASSWORD)) {
			DataAccessNotice daoNotice = DataAccessNotice.getinstance();
			int deleteCount = daoNotice.deleteNoticeOne(noticeId);

			if (deleteCount > 0) deleteSuccess = true;
	    }		

		return deleteSuccess;
	}
	
	public boolean insertHotplace(HotplaceBean dtoHotplaceBean) {
		
		boolean isWriteSuccess = false;
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		int insertCount = daoHotplace.insertPlace(dtoHotplaceBean);

		if (insertCount > 0) isWriteSuccess = true;
		
		return isWriteSuccess;
		
	}
	
	public List<HotplaceBean> selectHotplaceAll() {
		
		DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
		List<HotplaceBean> hotplaceList = daoHotplace.selectHotplaceListAllDesc();
		
		return hotplaceList;
		
	}

	public boolean updateHotplace(HotplaceBean hotplaceBean, String adminId, String adminPw) {
				
		boolean updateSuccess = false;
		
		if (adminId.equals(ADMIN_ID) && adminPw.equals(ADMIN_PASSWORD)) {
			DataAccessHotplace daoHotplace = DataAccessHotplace.getInstance();
			int updateCount = daoHotplace.updateHotplace(hotplaceBean);

			if (updateCount > 0) updateSuccess = true;
	    }		
		
		return updateSuccess;
	}

	public boolean deleteHotplaceOne(String hotplaceId, String adminId, String adminPw) {
		
		boolean deleteSuccess = false;

		if (adminId.equals(ADMIN_ID) && adminPw.equals(ADMIN_PASSWORD)) {
			DataAccessHotplace daoHotpalce = DataAccessHotplace.getInstance();
			int deleteCount = daoHotpalce.deleteHotplaceOne(hotplaceId);

			if (deleteCount > 0) deleteSuccess = true;
	    }		

		return deleteSuccess;
	}

}
