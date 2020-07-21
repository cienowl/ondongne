//작성자: 이호준

package com.ondongne.teampjt.users.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataAccessUsers {
	
	private static DataAccessUsers instance;
	
	public static DataAccessUsers getInstance() {
		if (instance == null) {
			synchronized (DataAccessUsers.class) {
				instance = new DataAccessUsers();
			}
			
		}
		return instance;
	}

	static SqlSessionFactory sqlFactory;
	
	public static SqlSessionFactory getConnection() {		
		Reader reader;
		try {
			reader = Resources.getResourceAsReader("com/ondongne/teampjt/users/mybatis-config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return sqlFactory;		
	}
		
}
