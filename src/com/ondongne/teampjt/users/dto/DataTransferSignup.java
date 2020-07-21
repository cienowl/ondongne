//작성자: 이호준

package com.ondongne.teampjt.users.dto;

//	ondongne.users
//	+----------------------+--------------+------+-----+---------+-------+
//	| Field                | Type         | Null | Key | Default | Extra |
//	+----------------------+--------------+------+-----+---------+-------+
//	| email                | varchar(50)  | NO   | PRI | NULL    |       |
//	| password             | varchar(20)  | NO   |     | NULL    |       |
//	| nickname             | varchar(20)  | YES  |     | NULL    |       |
//	| profile_picture      | varchar(100) | YES  |     | NULL    |       |
//	| birthday             | varchar(10)  | YES  |     | NULL    |       |
//	| phone                | varchar(20)  | YES  |     | NULL    |       |
//	| gender               | varchar(10)  | YES  |     | NULL    |       |
//	| zipcode              | varchar(10)  | YES  |     | NULL    |       |
//	| address              | varchar(50)  | YES  |     | NULL    |       |
//	| address_detail       | varchar(50)  | YES  |     | NULL    |       |
//	| region1              | varchar(10)  | YES  |     | NULL    |       |
//	| region2              | varchar(10)  | YES  |     | NULL    |       |
//	| region3              | varchar(10)  | YES  |     | NULL    |       |
//	| joindate             | date         | YES  |     | NULL    |       |
//	| last_signin_date     | date         | YES  |     | NULL    |       |
//	| business_owner       | varchar(10)  | YES  |     | NULL    |       |
//	| hibernate            | varchar(10)  | YES  |     | NULL    |       |
//	| hibernate_start_date | date         | YES  |     | NULL    |       |
//	| warning_count        | int(11)      | YES  |     | NULL    |       |
//	+----------------------+--------------+------+-----+---------+-------+

public class DataTransferSignup {
	
	private String email;
	private String password;
	private String nickname;
	private String profile_picture;
	private String birthday;
	private String phone;
	private String gender;
	private String zipcode;
	private String address;
	private String address_detail;
	private String region1;
	private String region2;
	private String region3;
	private String joindate;
	private String last_signin_date;
	private String business_owner;
	private String hibernate;
	private String hibernate_start_date;
	private int warning_count;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_picture() {
		return profile_picture;
	}
	public void setProfile_picture(String profile_picture) {
		this.profile_picture = profile_picture;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getRegion1() {
		return region1;
	}
	public void setRegion1(String region1) {
		this.region1 = region1;
	}
	public String getRegion2() {
		return region2;
	}
	public void setRegion2(String region2) {
		this.region2 = region2;
	}
	public String getRegion3() {
		return region3;
	}
	public void setRegion3(String region3) {
		this.region3 = region3;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getLast_signin_date() {
		return last_signin_date;
	}
	public void setLast_signin_date(String last_signin_date) {
		this.last_signin_date = last_signin_date;
	}
	public String getBusiness_owner() {
		return business_owner;
	}
	public void setBusiness_owner(String business_owner) {
		this.business_owner = business_owner;
	}
	public String getHibernate() {
		return hibernate;
	}
	public void setHibernate(String hibernate) {
		this.hibernate = hibernate;
	}
	public String getHibernate_start_date() {
		return hibernate_start_date;
	}
	public void setHibernate_start_date(String hibernate_start_date) {
		this.hibernate_start_date = hibernate_start_date;
	}
	public int getWarning_count() {
		return warning_count;
	}
	public void setWarning_count(int warning_count) {
		this.warning_count = warning_count;
	}

}
