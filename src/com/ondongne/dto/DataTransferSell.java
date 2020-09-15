// 작성자: 이호준

package com.ondongne.dto;

//	ondongne.sell
//	+-------------+--------------+------+-----+---------+----------------+
//	| Field       | Type         | Null | Key | Default | Extra          |
//	+-------------+--------------+------+-----+---------+----------------+
//	| email       | varchar(50)  | NO   | MUL | NULL    |                |
//	| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
//	| title       | varchar(50)  | NO   |     | NULL    |                |
//	| pictures    | text         | NO   |     | NULL    |                |
//	| region      | varchar(10)  | NO   |     | NULL    |                |
//	| post_date   | datetime     | NO   |     | NULL    |                |
//	| price       | varchar(20)  | NO   |     | NULL    |                |
//	| sell_method | varchar(10)  | NO   |     | NULL    |                |
//	| description | text         | NO   |     | NULL    |                |
//	| tags        | varchar(100) | NO   |     | NULL    |                |
//	| is_active   | tinyint(1)   | NO   |     | NULL    |                |
//	+-------------+--------------+------+-----+---------+----------------+

public class DataTransferSell{

	private int id;
	private String email;
	private String title;
	private String pictures;
	private String region;
	private String post_date;
	private String price;
	private boolean is_parcel;
	private String description;
	private String tags;
	private boolean is_active;
	private int post_count;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPictures() {
		return pictures;
	}
	public void setPictures(String pictures) {
		this.pictures = pictures;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public boolean isIs_parcel() {
		return is_parcel;
	}
	public void setIs_parcel(boolean is_parcel) {
		this.is_parcel = is_parcel;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public int getPost_count() {
		return post_count;
	}
	public void setPost_count(int post_count) {
		this.post_count = post_count;
	}
}
