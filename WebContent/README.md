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
    cienowl
* Other community or team contact
    Hojoon Lee, Naye Kim, Songhee Han, Jaehun Kim, Yongho Jeong

## JAVA

* JDK8.0

## JavaScript

* oo

## jQuery

* Version 2.2.4
* [google CDN](https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js)

## Bootstrap 4.5

이 사이트는 Bootstrap 4.5 기반으로 제작되었습니다.

## Database

* MySQL 5.7
* Mybatis
* 인코딩 세팅

  ~~~sql
  alter table userinfo convert to character set utf8;
  ~~~

  * Database: ondongne
  * Tables:
  
    userinfo: 회원가입 정보
  
    ~~~sql
    create table userinfo(email varchar(50) primary key, password varchar(20) not null, nickname varchar(15), profile_picture varchar(100), birth_year varchar(10), birth_month varchar(10), birth_day varchar(10), phone varchar(20), gender varchar(10), zipcode varchar(10), address varchar(50), address_detail varchar(50), region1 varchar(10), region2 varchar(10), region3 varchar(10), joindate date);
    ~~~

    `mysql> desc userinfo;`
    | Field           | Type         | Null | Key | Default | Extra |
    |-----------------|--------------|------|-----|---------|-------|
    | email           | varchar(50)  | NO   | PRI | NULL    |       |
    | password        | varchar(20)  | NO   |     | NULL    |       |
    | nickname        | varchar(15)  | YES  |     | NULL    |       |
    | profile_picture | varchar(100) | YES  |     | NULL    |       |
    | birth_year      | varchar(10)  | YES  |     | NULL    |       |
    | birth_month     | varchar(10)  | YES  |     | NULL    |       |
    | birth_day       | varchar(10)  | YES  |     | NULL    |       |
    | phone           | varchar(20)  | YES  |     | NULL    |       |
    | gender          | varchar(10)  | YES  |     | NULL    |       |
    | zipcode         | varchar(10)  | YES  |     | NULL    |       |
    | address         | varchar(50)  | YES  |     | NULL    |       |
    | address_detail  | varchar(50)  | YES  |     | NULL    |       |
    | region1         | varchar(10)  | YES  |     | NULL    |       |
    | region2         | varchar(10)  | YES  |     | NULL    |       |
    | region3         | varchar(10)  | YES  |     | NULL    |       |
    | joindate        | date         | YES  |     | NULL    |       |

    membership: 사용자 멤버쉽 등급