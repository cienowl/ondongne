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
		SqlSession sqlSession = sqlFactory.openSession();
		int updateCount = sqlSession.update("userUpdate", dtoUser);
		sqlSession.commit();
		sqlSession.close();

		return updateCount;

	}

	public DataTransferUsers userSelectOne (String checkEmail) {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		DataTransferUsers dto = sqlSession.selectOne("checkSignin", checkEmail);
		sqlSession.close();

		return dto;

	}

	public int deleteUser(String email) {	

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		int deleteCount = sqlSession.delete("userDelete", email);
		sqlSession.commit();
		sqlSession.close();

		return deleteCount;

	}

	public int setAvater(DataTransferUsers dtoUser) {

		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		int updateCount = sqlSession.update("setAvatar", dtoUser);
		sqlSession.commit();
		sqlSession.close();

		return updateCount;

	}
	
	public int deleteAvatar(String loginEmail) {
		
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();	
		int deleteCount = sqlSession.update("deleteAvatar", loginEmail);
		sqlSession.commit();
		sqlSession.close();
		
		return deleteCount;
	}	
	public String findEmail(DataTransferUsers dtoUser) {
		sqlFactory = getConnection();
		SqlSession sqlSession = sqlFactory.openSession();
		
		String email = sqlSession.selectOne("findEmail",dtoUser);
		sqlSession.close();
		
		return email;
	}

}
