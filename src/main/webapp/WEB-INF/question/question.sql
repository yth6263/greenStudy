create table if not exists `question` (
  idx int not null auto_increment,
  part varchar(30) not null,
  mid varchar(30) not null,
  content text not null,
  questionDate datetime not null default current_timestamp,
  questionPhoto varchar(255) null,
  primary key (idx),
  foreign key (mid) references member(mid) on delete cascade
);

create table if not exists `answer` (
  idx int not null auto_increment,
  qIdx int not null,
  mid varchar(30) not null,
  content text not null,
  answerDate datetime not null default current_timestamp,
  primary key (idx),
  foreign key (qIdx) references `question`(idx) on delete cascade,
  foreign key (mid) references member(mid) on delete cascade
);

select * from guestion;
select * from answer;

