show tables;

desc dbtest;

-- dbtest테이블(회원가입 연습테이블)
create table dbtest (
  idx  int not null auto_increment primary key,	/* 고유번호 */
  mid  varchar(20) not null,			/* 아이디 */
  pwd  varchar(15) not null,      /* 비밀번호 */
  name varchar(10) not null,			/* 성명 */
  gender char(2)   default '여자',	/* 성별 */
  age	 int  			 default 20			/* 나이 */
);

insert into dbtest values (default, 'admin', '1234', '관리자', '남자', 30);

select * from dbtest;

delete from dbtest;

