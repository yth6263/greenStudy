show tables;

create table yoga (
  idx  int not null auto_increment,
  part varchar(40) not null,
  title varchar(100) not null,
  content text,
  url varchar(100) not null,
  photo varchar(100) not null,
  primary key(idx)
);

insert into yoga values (default, '집중명상', '뇌를 위한 최고의 휴식법','스트레스로 지친 뇌를 잠시 쉬게 하고 머리를 맑게 하는 5분 명상 가이드입니다.','https://www.youtube.com/watch?v=dZewQEbQQM0','111.jpg');

select * from yoga;
