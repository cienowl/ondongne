// �옉�꽦�옄: 源��굹�삁

package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.DataTransferCircle;

public class DataAccessCircle {

	private static DataAccessCircle instance;
	public static DataAccessCircle getinstance() {

		if(instance == null) {
			synchronized(DataAccessCircle.class) {
				instance = new DataAccessCircle();
			}
		}
		return instance;
	}

	static SqlSessionFactory sqlFactory;
	public static SqlSessionFactory getConnection() {
		Reader reader;

		try {
			reader = Resources.getResourceAsReader("com/ondongne/dbconnect/mybatis-config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlFactory;
	}

	//소모임 등록
	public int circleInsert(DataTransferCircle dto) {
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();

		int insertCount =  sqlsession.insert("circleInsert", dto);
		sqlsession.commit();
		sqlsession.close();

		return insertCount;
	}
	
	// 전체 소모임 출력
	public List<DataTransferCircle> selectCircleAll(){
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		List<DataTransferCircle> circleList = sqlsession.selectList("getCirclePostAll");
		
		return circleList;
		
	}
	
	// 참여한 소모임 출력
	public List<DataTransferCircle> selectJoinCircle(String loginEmail){
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		List<DataTransferCircle> joinCircleList = sqlsession.selectList("getJoinCircle", loginEmail);
		
		return joinCircleList;
	}
	
	// 작성자가 게시글 수정
	public int circleUpdate(DataTransferCircle dto) {
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		int updateCount = sqlsession.update("circleUpdate", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return updateCount;
	}
	
	// 작성자가 게시글 삭제
	public int circleDelete(DataTransferCircle dto) {
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		int deleteCount = sqlsession.delete("circleDelete", dto);
		sqlsession.commit();
		sqlsession.close();
		
		return deleteCount;
	}
	
	// 작성자가 게시한 소모임만 출력
	public List<DataTransferCircle> selectPostCircle(String loginEmail){
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		List<DataTransferCircle> postCircleList = sqlsession.selectList("selectCircleByEmail",loginEmail);
		
		return postCircleList;
		
	}
	
	// 검색 버튼을 눌렀을 때
	public List<DataTransferCircle> searchCircle(String keyword){
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		List<DataTransferCircle> searchCircleList = sqlsession.selectList("getSearchCircle", keyword);
		
		return searchCircleList;
	}

}
