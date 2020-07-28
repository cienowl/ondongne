// 작성자: 이호준

package com.ondongne.dto;

//	ondongne.sell
//	+----------------+--------------+------+-----+---------+----------------+
//	| Field          | Type         | Null | Key | Default | Extra          |
//	+----------------+--------------+------+-----+---------+----------------+
//	| email          | varchar(50)  | NO   | MUL | NULL    |                |
//	| id             | int(11)      | NO   | PRI | NULL    | auto_increment |
//	| title          | varchar(50)  | NO   |     | NULL    |                |
//	| pictures       | text         | NO   |     | NULL    |                |
//	| region         | varchar(10)  | NO   |     | NULL    |                |
//	| post_date      | datetime     | NO   |     | NULL    |                |
//	| end_date       | date         | NO   |     | NULL    |                |
//	| end_time       | time         | YES  |     | NULL    |                |
//	| starting_price | varchar(20)  | NO   |     | NULL    |                |
//	| is_auction     | varchar(10)  | NO   |     | NULL    |                |
//	| bidding_price  | varchar(20)  | YES  |     | NULL    |                |
//	| sell_method    | varchar(10)  | NO   |     | NULL    |                |
//	| description    | text         | NO   |     | NULL    |                |
//	| tags           | varchar(100) | NO   |     | NULL    |                |
//	+----------------+--------------+------+-----+---------+----------------+

public class DataTransferSell{

	private String email;
	private String title;
	private String pictures;
	private String region;
	private String post_date;
	private String end_date;
	private String end_time;
	private String starting_price;
	private String is_auction;
	private String bidding_price;
	private String sell_method;
	private String description;
	private String tags;
	
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
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getStarting_price() {
		return starting_price;
	}
	public void setStarting_price(String starting_price) {
		this.starting_price = starting_price;
	}
	public String getIs_auction() {
		return is_auction;
	}
	public void setIs_auction(String is_auction) {
		this.is_auction = is_auction;
	}
	public String getBidding_price() {
		return bidding_price;
	}
	public void setBidding_price(String bidding_price) {
		this.bidding_price = bidding_price;
	}
	public String getSell_method() {
		return sell_method;
	}
	public void setSell_method(String sell_method) {
		this.sell_method = sell_method;
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
	
}
