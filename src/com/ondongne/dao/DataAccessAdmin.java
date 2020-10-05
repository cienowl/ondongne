//작성자: 이호준, 김나예

package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.AdminBean;
import com.ondongne.dto.DataTransferUsers;

public class DataAccessAdmin {

	private static DataAccessAdmin instance;
	public static DataAccessAdmin getInstance() {
		if (instance == null) {
			synchronized (DataAccessAdmin.class) {
				instance = new DataAccessAdmin();
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

	public AdminBean adminSelectOne (String id) {
		
		System.out.println("DAO ADMIN : "+id);

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		AdminBean adminBean = sqlSession.selectOne("checkAdmin", id);
		sqlSession.close();
		
		return adminBean;

	}

}
