package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessCircle;
import com.ondongne.dao.DataAccessHotplace;
import com.ondongne.dao.DataAccessNotice;
import com.ondongne.dao.DataAccessSell;
import com.ondongne.dao.DataAccessUsers;
import com.ondongne.dto.AdminBean;
import com.ondongne.dto.DataTransferCircle;
import com.ondongne.dto.DataTransferSell;
import com.ondongne.dto.DataTransferUsers;
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
	
	// 소모임 전체 게시물 불러오기
	public List<DataTransferCircle> getCircleAll(){
		
		DataAccessCircle daoCircle = DataAccessCircle.getinstance();
		List<DataTransferCircle> circleList = daoCircle.selectCircleAll();
		
		return circleList;
		
	}
	
	// 검색한 소모임 게시물 불러오기
	public List<DataTransferCircle> getSearchCircle(String searchWord){
		
		DataAccessCircle daoCircle = DataAccessCircle.getinstance();
		List<DataTransferCircle> searchCircleList = daoCircle.searchCircle(searchWord);
		
		return searchCircleList;
	}
	
	// 판매 전체 게시물 불러오기
	public List<DataTransferSell> getSellAll(){
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		List<DataTransferSell> sellList = daoSell.selectSellAll();
		
		return sellList;
	}
	
	// 검색한 판매 게시물 불러오기
	public List<DataTransferSell> getSearchSell(String searchWord){
		
		DataAccessSell daoSell = DataAccessSell.getInstance();
		List<DataTransferSell> searchSellList = daoSell.getSearchSell(searchWord);
		
		return searchSellList;
	}
	
	// 전체 회원정보 불러오기
	public List<DataTransferUsers> getUserAll(){
		
		DataAccessUsers daoUsers = DataAccessUsers.getInstance();
		List<DataTransferUsers> userList = daoUsers.getUsersAll();
		
		return userList;
	}
	
	// 검색한 회원 정보 불러오기
	public List<DataTransferUsers> getSearchUser(String searchWord){
		
		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		List<DataTransferUsers> searchUserList = daoUser.getSearchUser(searchWord);
		
		return searchUserList;
	}

}
