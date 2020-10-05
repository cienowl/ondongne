# ON동네

온동네 웹사이트 팀 포트폴리오

### What is this repository for

이 웹사이트는 팀 포트폴리오를 위해 제작되었습니다.

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up

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

## Colors
https://color.adobe.com/ko/trends/Interaction
8C0327
F2D852
F2D4C2
F2F2F2
404040

## JAVA

* ORACLE JDK8.0

### Ext API

- GSON https://search.maven.org/artifact/com.google.code.gson/gson/2.8.6/jar


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
  `name` varchar(20) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
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
  PRIMARY KEY (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
~~~

sell: 판매 테이블

~~~sql
CREATE TABLE `sell` (
  `email` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `region` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `is_parcel` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `pictures` text NOT NULL,
  `tags` varchar(100) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_count` int(11) DEFAULT '0',
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
  `mem_number` varchar(30) NOT NULL,
  `post_count` int(11) DEFAULT '0',
  `join_mem_number` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_idx` (`email`),
  CONSTRAINT `circle_email` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~

hotplace: 동네장소 테이블

~~~sql
CREATE TABLE `hotplace` (
  `admin_id` varchar(20) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `pictures` text NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `address_detail` varchar(50) NOT NULL,
  `region` varchar(10) NOT NULL,
  `postdate` datetime NOT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `description` text,
  `post_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hotplace_author_idx` (`admin_id`),
  CONSTRAINT `hotplace_author` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT DEFAULT CHARSET=utf8
~~~

notice: 공지사항 테이블

~~~sql
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `postdate` datetime NOT NULL,
  `author` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_notice_idx` (`author`),
  CONSTRAINT `author_notice` FOREIGN KEY (`author`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAUTL DEFAULT CHARSET=utf8
~~~

helper_circle : 참여한 소모임 테이블

~~~sql
CREATE TABLE `helper_circle` (
  `join_email` varchar(50) NOT NULL,
  `join_postid` int(11) NOT NULL,
  KEY `join_email_circle_idx` (`join_email`),
  KEY `join_postid_circle_idx` (`join_postid`),
  CONSTRAINT `helper_circle_email` FOREIGN KEY (`join_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helper_circle_postid` FOREIGN KEY (`join_postid`) REFERENCES `circle` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
~~~

helper_sell : 스크랩한 판매글

~~~sql
CREATE TABLE `helper_sell` (
  `join_email` varchar(50) NOT NULL,
  `join_postid` int(11) NOT NULL,
  KEY `join_email_sell_idx` (`join_email`),
  KEY `join_postid_sell_idx` (`join_postid`),
  CONSTRAINT `helper_sell_email` FOREIGN KEY (`join_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `helper_sell_postid` FOREIGN KEY (`join_postid`) REFERENCES `sell` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
~~~

helper_hotplace : 스크랩한 장소

~~~sql
CREATE TABLE `helper_hotplace` (
  `scrap_id` int(11) NOT NULL,
  `scrap_email` varchar(50) NOT NULL,
  KEY `scrap_id_idx` (`scrap_id`),
  KEY `scrap_email_idx` (`scrap_email`),
  CONSTRAINT `scrap_email` FOREIGN KEY (`scrap_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scrap_id` FOREIGN KEY (`scrap_id`) REFERENCES `hotplace` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
~~~

admin : 어드민 정보

~~~sql
CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(11) DEFAULT '5',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
~~~
