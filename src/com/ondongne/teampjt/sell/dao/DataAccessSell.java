package com.ondongne.teampjt.sell.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
			reader = Resources.getResourceAsReader("com/ondongne/teampjt/sell/mybatis-config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return sqlFactory;
	}
	

}
