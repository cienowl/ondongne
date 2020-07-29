package com.ondongne.service;

import com.ondongne.dao.DataAccessSell;
import com.ondongne.dto.DataTransferSell;

public class SellService {
	
	public boolean postSell(DataTransferSell dtoSell) {

		DataAccessSell daoSell = DataAccessSell.getInstance();
		int insertCount = daoSell.insertSellPost(dtoSell);	//mybatis 쿼리 실행후 리턴으로 성공 줄수 확인

		boolean isWriteSuccess = false;
		
		if (insertCount > 0) isWriteSuccess = true;	//sql 문이 정상적으로 실행되었으면
		
		return isWriteSuccess;
		
	}
	
	public void selectSellOne() {
//		TODO: 한개 내용만 가져오기
	}
	
	public void selectSellAll() {
//		TODO: 화면에 뿌려줄 전체 가져오기
	}

//	public void getUser(String signinEmail) throws Exception{	//로그인을 위한 DB 정보 읽어오는 메소드
//		
//		Connection con = getConnection();	//sql Connection 객체 생성후 JdbcUtil.getConnection() 실행 (getConnection()은 static으로 선언된 유일한 메소드라 바로 호출 가능)
//		DataAccessUsers usersDAO = DataAccessUsers.getInstance();	//boardDAO 객체 생성. 이미 생성된 것이 있으면 기존 것 사용 (싱글톤 기법)
//		usersDAO.setConnection(con);		//DataAccessBoard setConnection() 메소드 실행 매개변수 con
//		
//		UsersBean usersBean = usersDAO.selectUser(signinEmail);	//받아온 boardBean DTO를 이용해 sql insert 메소드 실행
//		
//		close(con);	//connection close()
//
//	}

}
