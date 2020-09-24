package com.ondongne.service;

import com.ondongne.dao.DataAccessUsers;
import com.ondongne.dto.DataTransferUsers;

public class UsersService {
	
//	로그인 확인
	public DataTransferUsers checkUser(DataTransferUsers userBean) throws Exception{
		
//		userBean : 로그인창에서 입력받은 값
//		boolean userSuccess = false;	//입력받은값과 DB에 저장된값 체크하기 위한 변수
		String dbEmail = null;
		String dbPassword = null;
		
		DataAccessUsers userDAO = DataAccessUsers.getInstance();
//		입력받은 이메일값만 가지고 select
		DataTransferUsers dto = userDAO.userSelectOne(userBean.getEmail());
		dbEmail = dto.getEmail();
		dbPassword = dto.getPassword();
//		System.out.println(dbEmail+"/"+dbPassword);
		
//		정보가 DB와 일치할때
		if(userBean.getEmail().equals(dbEmail)&&userBean.getPassword().equals(dbPassword)) {
			return dto;
		}
//		DB정보와 일치하지 않을때
		else {
			return null;
		}
		
//		return userSuccess;
	}
	
	public boolean signupBasic(DataTransferUsers dtoUser) {
		
		boolean isWriteSuccess = false;
		
		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		int insertCount = daoUser.userInsert(dtoUser);
		
		if (insertCount > 0) isWriteSuccess = true;
				
		return isWriteSuccess;
		
	}
	
	public boolean signupSub(DataTransferUsers dtoUser) {

		boolean isUpdateSuccess = false;

		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		int updateCount = daoUser.userUpdate(dtoUser);
		
		if (updateCount > 0) {
			isUpdateSuccess = true;
			System.out.println("userUpdate " + isUpdateSuccess);
		}		

		return isUpdateSuccess;

	}
	
	public boolean deleteUser(DataTransferUsers currentUser) {
		
		String email = currentUser.getEmail();
		boolean deleteSuccess = false;
		
		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		DataTransferUsers dbUser = daoUser.userSelectOne(email);
		
		if (currentUser.getPassword().equals(dbUser.getPassword())) {
			int deleteCount = daoUser.deleteUser(email);
			
			if (deleteCount > 0) {
				deleteSuccess = true;
				System.out.println("delete success");
			}
		} else {
			System.out.println("wrong password");
		}
		
		return deleteSuccess;
	}
	
	public boolean signout() {
		
		return true;
	}
	
	public boolean setAvatar(DataTransferUsers dtoUser) {
		
		boolean isUpdateSuccess = false;
		
		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		int updateCount = daoUser.setAvater(dtoUser);
		
		if (updateCount > 0) {
			isUpdateSuccess = true;
			System.out.println("setAvater" + isUpdateSuccess);
		}
		
		return isUpdateSuccess;
	}
	
	// 이메일 찾기
	public String findEmail(DataTransferUsers dtoUser) {
		boolean findSuccess = false;
		
		DataAccessUsers userDao = DataAccessUsers.getInstance();
		String email = userDao.findEmail(dtoUser);
		
		return email;
	}
	
	// 아바타 지우기
	public boolean deleteAvatar(String loginEmail) {
		boolean isDeleteSuccess = false;
		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		int deleteCount = daoUser.deleteAvatar(loginEmail);
		
		if(deleteCount>0) {
			isDeleteSuccess = true;
			System.out.println("deleteAvatar"+isDeleteSuccess);
		}
		
		return isDeleteSuccess;
	}
	
}
