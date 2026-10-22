create table photo (
  idx int not null auto_increment,
  title varchar(200) not null,
  content text not null,
  photoName text not null,
  photoDate datetime not null default current_timestamp,
  primary key (idx)
);
