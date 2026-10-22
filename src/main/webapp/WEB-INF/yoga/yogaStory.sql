
create table yogaStory (
  idx int not null auto_increment,
  part varchar(40) not null,
  title varchar(100) not null,
  content text,
  photo varchar(100) not null,
  primary key(idx)
);

insert into yogaStory values (default, '하타요가','기본적인 요가스타일','호흡과 명상에 집중한다','111.png');

select * from yogaStory;

delete from yogaStory;
