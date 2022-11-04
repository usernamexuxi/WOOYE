create DATABASE wooyedb;
use wooyedb;

CREATE TABLE `users` (
  `ID` varchar(8) NOT NULL,
  `PASSWORD` varchar(8) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `NICKNAME` varchar(20) NOT NULL,
  `ROLE` int(5) DEFAULT 0,
  `NUMBER` VARCHAR(20)	NULL,
  `BIRTH` VARCHAR(20) NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SELECT * FROM wooyedb.users;

CREATE TABLE board (
  SEQ int(5) NOT NULL AUTO_INCREMENT,
  TITLE varchar(200) NOT NULL,
  WRITER varchar(30) not null,
  CONTENT varchar(2000) DEFAULT NULL,
  REGDATE date DEFAULT NULL,
  CNT int(11) DEFAULT 0,
  heart int(11) DEFAULT 0,
  PRIMARY KEY (SEQ),
  FOREIGN KEY (WRITER) REFERENCES users (ID)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
SELECT * FROM wooyedb.board;

CREATE TABLE `board_comment` (
	`comment_num`		INT(11)	AUTO_INCREMENT	NOT NULL,
	`comment_content`	TEXT		NOT NULL,
	`board_num`		INT(11)		NOT NULL,
	`id`			VARCHAR(20)	NOT NULL,
	`comment_date`	  	VARCHAR(20)	             DEFAULT NULL,
    PRIMARY KEY (`comment_num`),
    FOREIGN KEY (`board_num`) REFERENCES `board` (`SEQ`), 
    FOREIGN KEY (`id`) REFERENCES `users` (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table `board_like`;
CREATE TABLE `board_like` (
	`seq` int(5) NOT NULL AUTO_INCREMENT,
	`board_num`	INT(11) NOT NULL,
	`id`	VARCHAR(20)	NOT NULL,
    PRIMARY KEY (`seq`),
    FOREIGN KEY (`board_num`) REFERENCES `board` (`SEQ`), 
	FOREIGN KEY (`id`) REFERENCES `users` (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table ott;
create table ott(
    ott_num varchar(20) not null,
    img varchar(500) default null,
    title varchar(50) not null,
    period varchar(50),
    content varchar(500),
    place varchar(50),
    price int(5) not null,
    support varchar(50),
    artist varchar(50),
    heart int(5) DEFAULT 0,
	PRIMARY KEY (ott_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SELECT * FROM wooyedb.ott;

ALTER TABLE `ott` ADD `video` VARCHAR(500);

drop table cash;
CREATE TABLE `cash` (
	`id`	VARCHAR(20)	NOT NULL,
	`cash_get` INT(11)	default 0,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`id`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table `ott_like`;
CREATE TABLE `ott_like` (
	`seq` int(5) NOT NULL AUTO_INCREMENT,
	`ott_num`	VARCHAR(20) NOT NULL,
	`id`	VARCHAR(20)	NOT NULL,
	PRIMARY KEY (`seq`),
    FOREIGN KEY (`ott_num`) REFERENCES `ott` (`OTT_NUM`),
	FOREIGN KEY (`id`) REFERENCES `users` (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SELECT * FROM wooyedb.user_ott;
drop table user_ott;
CREATE TABLE user_ott (
	seq int(5) NOT NULL AUTO_INCREMENT,
    id    VARCHAR(20)    NOT NULL,
    ott_num    varchar(20)   NOT NULL,
    img varchar(50) default null,
    title varchar(50) not null,
    period varchar(50),
    content varchar(1000),
    place varchar(50),
    price varchar(20) not null,
    support varchar(50),
    artist varchar(50),
    heart int(5) DEFAULT 0,
    PRIMARY KEY (seq),
    FOREIGN KEY (ott_num) REFERENCES ott (OTT_NUM),
    FOREIGN KEY (id) REFERENCES users (ID)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

create table excon_user( 
    seq int(5) not null auto_increment primary key,
    user_id varchar(8) not null,
    excon_seq varchar(20) not null,
    excon_name varchar(100) not null,
    start_date varchar(20) not null,
    end_date varchar(20) not null,
    place varchar(100) not null,
    genre varchar(20) not null,
    FOREIGN KEY (user_id) REFERENCES users (ID)
) engine=InnoDB auto_increment = 1 default charset=utf8;

drop table clean_board;
CREATE TABLE clean_board (
	seq int(5) NOT NULL AUTO_INCREMENT,
    id    VARCHAR(8)    NOT NULL,
    board_num    INT(5)    NOT NULL,
    board_writer varchar(30) not null,
    board_title varchar(200) NOT NULL,
    PRIMARY KEY (seq)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table clean_comment;
CREATE TABLE clean_comment (
	seq int(5) NOT NULL AUTO_INCREMENT,
    id    VARCHAR(8)    NOT NULL,
    board_num    INT(5)    NOT NULL,
    comment_num INT(11) NOT NULL,
    comment_writer VARCHAR(20)	NOT NULL,
    comment_content	TEXT		NOT NULL,
	PRIMARY KEY (seq)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table my_artist;
CREATE TABLE my_artist (
	seq int(5) NOT NULL AUTO_INCREMENT,
	id    VARCHAR(8)    NOT NULL,
    title  VARCHAR(500)    NOT NULL,
    PRIMARY KEY (seq)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table my_musician;
CREATE TABLE my_musician (
	seq int(5) NOT NULL AUTO_INCREMENT,
	id    VARCHAR(8)    NOT NULL,
    title  VARCHAR(500)    NOT NULL,
    PRIMARY KEY (seq)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table my_art;
CREATE TABLE my_art (
	seq int(5) NOT NULL AUTO_INCREMENT,
	id    VARCHAR(8)    NOT NULL,
    title  VARCHAR(500)    NOT NULL,
    PRIMARY KEY (seq)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table my_classic;
CREATE TABLE my_classic (
	seq int(5) NOT NULL AUTO_INCREMENT,
	id    VARCHAR(8)    NOT NULL,
    title  VARCHAR(500)    NOT NULL,
    PRIMARY KEY (seq)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table my_era;
CREATE TABLE my_era (
	seq int(5) NOT NULL AUTO_INCREMENT,
	id    VARCHAR(8)    NOT NULL,
    title  VARCHAR(500)    NOT NULL,
    PRIMARY KEY (seq)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* 
classic
masterpiece
grade
DB는 csv 파일로 테이블 만듬...
*/