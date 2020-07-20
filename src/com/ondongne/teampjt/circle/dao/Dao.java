package com.ondongne.teampjt.circle.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.ondongne.teampjt.circle.dto.Dto;

public class Dao {
	
	static SqlSessionFactory sqlfactory;
	
	private static Dao instance;
	
	public static Dao getinstance() {
		if(instance == null) {
			synchronized(Dao.class) {
				instance = new Dao();
			}
		}
		return instance;
	}
	public static SqlSessionFactory getConn() {
		try {
			Reader reader = Resources.getResourceAsReader("com/ondongne/teampjt/circle/dao/mybatis_config.xml");
			sqlfactory = new SqlSessionFactoryBuilder().build(reader);
		}catch(IOException e1) {
			System.out.println(e1);
		}return sqlfactory;
	}
	
	public void circleInsert(Dto dto) {
		SqlSession sqlsession = sqlfactory.openSession();
		String title =  dto.getTitle();
		String region = dto.getRegion();
		String zipcode = dto.getZipcode();
		String address = dto.getAddress();
		String address_detail = dto.getAddress_detail();
		String event_date = dto.getEvent_date();
		String end_date = dto.getEnd_date();
		String gender = dto.getGender();
		String description = dto.getDescription();
		
		
		sqlsession.insert("circleInsert",dto);
		sqlsession.commit();
		sqlsession.close();
	}
	

}
