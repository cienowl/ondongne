package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.DataTransferSellJoin;

public class DataAccessSellJoin {
	
	private static DataAccessSellJoin instance;
	public static DataAccessSellJoin getInstance() {
		if (instance == null) {
			synchronized (DataAccessSellJoin.class) {
				instance = new DataAccessSellJoin();
			}
		}
		return instance;
	}
	
	static SqlSessionFactory sqlFactory;
	public SqlSessionFactory getConnection() {
		Reader reader;
		
		try {
			reader = Resources.getResourceAsReader("com/ondongne/dbconnect/mybatis-config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e) {
			e.printStackTrace();
		}
		return sqlFactory;
	}
	
	public int joinSellInsert(DataTransferSellJoin dtoSellJoin) {		
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();

		int insertCount = sqlSession.insert("joinSellInsert", dtoSellJoin);
		sqlSession.commit();
		sqlSession.close();

		return insertCount;
	}
	
	public int joinSellCheck(DataTransferSellJoin dtoSellJoin) {		
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();

		int joinCount = sqlSession.selectOne("getJoinSell", dtoSellJoin);
		sqlSession.commit();
		sqlSession.close();

		return joinCount;
	}

}
