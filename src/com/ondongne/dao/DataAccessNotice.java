package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.NoticeBean;

public class DataAccessNotice {

	private static DataAccessNotice instance;
	public static DataAccessNotice getinstance() {

		if(instance == null) {
			synchronized(DataAccessNotice.class) {
				instance = new DataAccessNotice();
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

	public int insertNotice(NoticeBean noticeBean) {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();

		int insertCount = sqlSession.insert("insertNotice", noticeBean);
		sqlSession.commit();
		sqlSession.close();

		return insertCount;

	}

	public List<NoticeBean> selectNoticeAll() {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();

		List<NoticeBean> noticeList = sqlSession.selectList("selectNoticeAll");
		sqlSession.close();

		return noticeList;

	}
	
	public int deleteNoticeOne(String id) {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();

		int deleteCount = sqlSession.delete("deleteNoticeOne", id);		
		sqlSession.commit();
		sqlSession.close();

		return deleteCount;

	}

	public int updateNotice(NoticeBean noticeBean) {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();

		int updateCount = sqlSession.update("updateNotice", noticeBean);
		sqlSession.commit();
		sqlSession.close();		

		return updateCount;

	}
	
	// 공지사항 검색
	public List<NoticeBean> searchNotice(String keyword){
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		
		List<NoticeBean> searchNoticeList = sqlsession.selectList("searchNoticeList",keyword);
		
		return searchNoticeList;
		
	}
	

}
