-- DB
# DROP database IF exists home;
# CREATE database home CHARACTER SET=utf8mb4;
# home database 생성 후 아파트 실거래 SQL 파일 실행

use home;

create table sidocode
select left(dongCode, 2) as code, sidoName as name
  from dongcode
 where gugunName is null;

create table guguncode
select left(dongCode, 5) as code, gugunName as name
  from dongcode
 where gugunName is not null
   and dongName is null;
   
alter table dongcode
rename column dongCode to code;
alter table dongcode
rename column dongName to name;

DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS user;

create table `user`(
	`id` varchar(30) not null ,
    `pwd` varchar(50) not null,
    `name` varchar(30) not null,
    `email` varchar(100) not null,
    `tel` varchar(50) not null,
    
    Primary key(id)
) ENGINE=InnoDB;


create table `notice`(
	`no` int NOT NULL auto_increment,
    `title` varchar(200) not null,
    `content` varchar(4000) not null,
    `author` varchar(20) not null,
    `hit` int default 0,
    `register_time` timestamp default now(),
    
	PRIMARY KEY (`no`)
) ENGINE=InnoDB;

INSERT INTO
    user(`id`, `pwd`, `name`, `email`, `tel`)
VALUES
    ('ssafy', '1234', '김싸피', 'ssafy@gmail.com', '111-1111-1111');

INSERT INTO
    notice(`title`, `content`, `author`)
VALUES
    ('공지사항', '공지사항 내용입니다2.', 'ssafy'),
    ('공지사항', '공지사항 내용입니다2.', 'ssafy'),
    ('공지사항', '공지사항 내용입니다2.', 'ssafy'),
    ('공지사항', '공지사항 내용입니다2.', 'ssafy'),
	('공지사항', '공지사항 내용입니다.', '김싸피'),
    ('공지사항', '공지사항 내용입니다.', '김싸피'),
    ('공지사항', '공지사항 내용입니다.', '김싸피'),    
	('공지사항', '공지사항 내용입니다.', '김싸피');

select * from notice;
select * from user;

desc notice;
desc user;