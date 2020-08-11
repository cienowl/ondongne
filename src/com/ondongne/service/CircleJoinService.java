package com.ondongne.service;

import com.ondongne.dao.DataAccessCircleJoin;
import com.ondongne.dto.DataTransferCircleJoin;

public class CircleJoinService {

	// 참여버튼 눌렀을 때 참여게시물 "등록"
	public boolean joinCircle(DataTransferCircleJoin circleBean) throws Exception{

		boolean isWriteSuccess = false;

		DataAccessCircleJoin circleDao = DataAccessCircleJoin.getInstance();
		int insertCount = circleDao.joinCircleInsert(circleBean);

		// 게시물 입력값이 제대로 입력된경우
		if (insertCount > 0) {
			isWriteSuccess = true;
		}
		return isWriteSuccess;
	}

	// 참여버튼 눌렀을 때 참여한 게시물인지 check (select)
	public int checkCircle(DataTransferCircleJoin circleBean) {

		DataAccessCircleJoin circleDao = DataAccessCircleJoin.getInstance();
		int joinCount = circleDao.joinCircleCheck(circleBean);

		return joinCount;
	}
	
	// 참여자가 참여 취소했을때
	public boolean cancelJoinCircle(DataTransferCircleJoin circleBean) throws Exception{
		boolean isWriteSuccess = false;
		
		DataAccessCircleJoin circleDao = DataAccessCircleJoin.getInstance();
		int cancelCount = circleDao.cancelJoinCircle(circleBean);
		
		if(cancelCount>0) {
			isWriteSuccess = true;
		}
		
		return isWriteSuccess;
	}

}
