//작성자: 이호준, 김나예

package com.ondongne.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ondongne.dto.DataTransferUsers;

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
			reader = Resources.getResourceAsReader("com/ondongne/dbconnect/mybatis-config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlFactory;
	}
	
	public void userUpdate(DataTransferUsers dto) {

		SqlSession sqlsession = sqlFactory.openSession();
		dto.getEmail();
		dto.getPassword();
		dto.getPhone();
		dto.getBirthday();
		dto.getGender();
		dto.getNickname();
		dto.getZipcode();
		dto.getAddress();
		dto.getAddress_detail();
		dto.getRegion1();
		dto.getRegion2();
		dto.getRegion3();
		sqlsession.update("userUpdate", dto);
		sqlsession.commit();
		sqlsession.close();

	}
	
	public void userDelete(String email) {	

		SqlSession sqlsession = sqlFactory.openSession();
		sqlsession.delete("userDelete", email);
		sqlsession.commit();
		sqlsession.close();

	}
	
}
