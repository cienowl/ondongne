# ON동네 

온동네 웹사이트 팀 포트폴리오

### What is this repository for?

이 웹사이트는 팀 포트폴리오를 위해 제작되었습니다.
* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up?

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines

* Writing tests
* Code review
* Other guidelines

### Who do I talk to?

* Repo owner or admin
* https://github.com/cienowl/Ondongne
  Hojoon Lee
* Other community or team contact
  Hojoon Lee, Naye Kim, Songhee Han, Jaehun Kim, Yongho Jeong

## JAVA

* ORACLE JDK8.0

## JavaScript

* oo

## jQuery

* Version 2.2.4
* [google CDN](https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js)

## Bootstrap 4.5

이 사이트는 Bootstrap 4.5 기반으로 제작되었습니다.

## Database

* MySQL 5.7
* Mybatis 3.1
* Database: ondongne

### Tables

users: 회원 테이블

~~~sql
CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `address_detail` varchar(50) DEFAULT NULL,
  `region1` varchar(10) DEFAULT NULL,
  `region2` varchar(10) DEFAULT NULL,
  `region3` varchar(10) DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `last_signin_date` date DEFAULT NULL,
  `business_owner` varchar(10) DEFAULT NULL,
  `hibernate` varchar(10) DEFAULT NULL,
  `hibernate_start_date` date DEFAULT NULL,
  `warning_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~

sell: 판매 테이블

~~~sql
CREATE TABLE `sell` (
  `email` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `pictures` text NOT NULL,
  `region` varchar(10) NOT NULL,
  `post_date` datetime NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time DEFAULT NULL,
  `starting_price` varchar(20) NOT NULL,
  `is_auction` varchar(10) NOT NULL,
  `bidding_price` varchar(20) DEFAULT NULL,
  `sell_method` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_email_idx` (`email`),
  CONSTRAINT `sell_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~

circle: 소모임 테이블

~~~sql
CREATE TABLE `circle` (
  `email` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `pictures` text NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `address_detail` varchar(50) NOT NULL,
  `region` varchar(10) NOT NULL,
  `post_date` date NOT NULL,
  `event_date` date NOT NULL,
  `end_date` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `start_age` int(11) DEFAULT NULL,
  `end_age` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `circle_email_idx` (`email`),
  CONSTRAINT `circle_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~

hotplace: 동네장소 테이블

~~~sql
CREATE TABLE `hotplace` (
  `email` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `pictures` text NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `address_detail` varchar(50) NOT NULL,
  `region` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotplace_email_idx` (`email`),
  CONSTRAINT `hotplace_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~

notice: 공지사항 테이블

~~~sql
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `postdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~

helper_circle : 참여한 소모임 테이블

~~~sql
CREATE TABLE `helper_circle` (
  `join_email` varchar(50) NOT NULL,
  `join_postid` int(11) NOT NULL,
  KEY `join_email_idx` (`join_email`),
  KEY `join_postid_idx` (`join_postid`),
  CONSTRAINT `join_email` FOREIGN KEY (`join_email`) REFERENCES `users` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `join_postid` FOREIGN KEY (`join_postid`) REFERENCES `circle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~
