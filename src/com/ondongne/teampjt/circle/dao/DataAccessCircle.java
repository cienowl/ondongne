// 작성자: 김나예

package com.ondongne.teampjt.circle.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.ondongne.teampjt.circle.dto.DataTransferCircle;

public class DataAccessCircle {

	static SqlSessionFactory sqlFactory;

	private static DataAccessCircle instance;

	public static DataAccessCircle getinstance() {

		if(instance == null) {
			synchronized(DataAccessCircle.class) {
				instance = new DataAccessCircle();
			}
		}
		return instance;
	}

	public static SqlSessionFactory getConnection() {
		Reader reader;

		try {
			reader = Resources.getResourceAsReader("com/ondongne/teampjt/circle/mybatis_config.xml");
			sqlFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sqlFactory;
	}

	public void circleInsert(DataTransferCircle dto) {

		SqlSession sqlsession = sqlFactory.openSession();

		sqlsession.insert("circleInsert", dto);
		sqlsession.commit();
		sqlsession.close();

	}

}
