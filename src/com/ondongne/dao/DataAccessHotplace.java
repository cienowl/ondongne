package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.HotplaceBean;

public class DataAccessHotplace {

	private static DataAccessHotplace instance;
	public static DataAccessHotplace getInstance() {
		if(instance == null) {
			synchronized (DataAccessHotplace.class) {
				instance = new DataAccessHotplace();
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
	
	public int insertPlace(HotplaceBean dtoHotplaceBean) {
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		
		int insertCount = sqlSession.insert("insertHotplace", dtoHotplaceBean);
		sqlSession.commit();
		sqlSession.close();
		
		return insertCount;
	}
	
	public List<HotplaceBean> listCardHotplace() {
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		
		List<HotplaceBean> hotplaceList = sqlSession.selectList("listCard");
		sqlSession.close();
		
		return hotplaceList;
	}
	
	public List<HotplaceBean> selectHotplaceListAllDesc() {
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		
		List<HotplaceBean> hotplaceList = sqlSession.selectList("selectHotplaceListDesc");
		sqlSession.close();
		
		return hotplaceList;
	}

	public int updateHotplace(HotplaceBean hotplaceBean) {
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		
		int updateCount = sqlSession.update("updateHotplace", hotplaceBean);
		sqlSession.commit();
		sqlSession.close();
		
		return updateCount;
	}

	public int deleteHotplaceOne(String id) {		
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		
		int deleteCount = sqlSession.delete("deleteHotplace", id);
		sqlSession.commit();
		sqlSession.close();
		
		return deleteCount;
	}
	
}
