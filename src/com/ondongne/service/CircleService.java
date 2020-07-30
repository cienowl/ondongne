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
	
	public List<DataTransferCircle> selectCircleAll(){
		
		DataAccessCircle daoCircle = DataAccessCircle.getinstance();
		List<DataTransferCircle> circleList = daoCircle.selectCircleAll();
		
		return circleList;
	}
}
