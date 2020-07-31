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

	public int userInsert (DataTransferUsers dtoUser) {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		int insertCount = sqlSession.insert("insertBasicInfo", dtoUser);
		sqlSession.commit();
		sqlSession.close();

		return insertCount;

	}

	public int userUpdate(DataTransferUsers dtoUser) {
		
		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		int updateCount = sqlsession.update("userUpdate", dtoUser);
		sqlsession.commit();
		sqlsession.close();

		return updateCount;

	}

	public DataTransferUsers userSelectOne (String checkEmail) {

		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		DataTransferUsers dto = sqlsession.selectOne("checkSignin", checkEmail);

		return dto;

	}

	public int deleteUser(String email) {	

		sqlFactory = getConnection();
		SqlSession sqlsession = sqlFactory.openSession();
		int deleteCount = sqlsession.delete("userDelete", email);
		sqlsession.commit();
		sqlsession.close();

		return deleteCount;

	}

}
