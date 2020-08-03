package com.ondongne.service;

import java.util.List;

import com.ondongne.dao.DataAccessCircle;
import com.ondongne.dto.DataTransferCircle;

public class CircleService {
	
	// 소모임 게시물 등록
	public boolean registArticle(DataTransferCircle circleBean) throws Exception{
		
		boolean isWriteSuccess = false;
		//System.out.print(circleBean.getAddress());
		DataAccessCircle circleDAO = DataAccessCircle.getinstance();
		int insertCount = circleDAO.circleInsert(circleBean);
		
		// 게시물 입력값이 제대로 입력되었으면
		if (insertCount>0) {
			
			isWriteSuccess = true;
		}
		//System.out.print(isWriteSuccess);
		return isWriteSuccess;
	}
	
	// 소모임 페이지에 모든 소모임 게시물 출력
	public List<DataTransferCircle> selectCircleAll(){
		
		DataAccessCircle daoCircle = DataAccessCircle.getinstance();
		List<DataTransferCircle> circleList = daoCircle.selectCircleAll();
		
		return circleList;
	}
	
	// 참여한 소모임만 마이페이지에 출력
	public List<DataTransferCircle> selectJoinCircle(String loginEmail){
		
		DataAccessCircle daoCircle = DataAccessCircle.getinstance();
		List<DataTransferCircle> joinCircleList = daoCircle.selectJoinCircle(loginEmail);
		
		return joinCircleList;
	}
	
}