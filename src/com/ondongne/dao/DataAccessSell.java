package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.DataTransferSell;

public class DataAccessSell {

	private static DataAccessSell instance;
	public static DataAccessSell getInstance() {
		if(instance == null) {
			synchronized (DataAccessSell.class) {
				instance = new DataAccessSell();
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
	
	public int insertSellPost(DataTransferSell dtoSell) {
				
		SqlSession sqlSession = sqlFactory.openSession();
		
		int insertCount = sqlSession.insert("sellPost", dtoSell);	//insert리턴 확인		
		sqlSession.commit();	//commit()
		sqlSession.close();
		
		return insertCount;	//sql insert 성공하면 true 아니면 false 리턴
		
	}

}
