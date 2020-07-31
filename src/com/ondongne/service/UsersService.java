package com.ondongne.service;

import com.ondongne.dao.DataAccessUsers;
import com.ondongne.dto.DataTransferUsers;

public class UsersService {
	
//	로그인 확인
	public boolean checkUser(DataTransferUsers userBean) throws Exception{
		
//		userBean : 로그인창에서 입력받은 값
		boolean userSuccess = false;	//입력받은값과 DB에 저장된값 체크하기 위한 변수
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
			userSuccess = true;
		}
//		DB정보와 일치하지 않을때
		else {
			userSuccess = false;
		}
		
		return userSuccess;
	}
	
	public boolean signupBasic(DataTransferUsers dtoUser) {
		
		boolean isWriteSuccess = false;
		
		DataAccessUsers daoUser = DataAccessUsers.getInstance();
		int insertCount = daoUser.userInsert(dtoUser);
		
		if (insertCount > 0) {
			isWriteSuccess = true;
			System.out.println("userInsert " + isWriteSuccess);
		}
		
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
	
}
