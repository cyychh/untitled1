drop database if exists db_csdn;
create database db_csdn;
show databases ;

drop table if exists db_csdn.user;
create table db_csdn.user(
  id int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'username NN',
  password varchar(255) not null comment 'password NN',
  email varchar(255)not null comment 'email NN'
)comment 'user table';

load data local infile 'D:/www.csdn.net.sql'
  into table db_csdn.user
fields terminated by '♥'
  (username,password,email)
set id =null;

select * from db_csdn.user;

select count(*)
from db_csdn.user;

-- 查询排名前十的密码

select password, count(password)
from db_csdn.user
group by password
order by 2 desc
limit 10 offset 0;

-- 排名前十的邮箱
select email, count(email)
from db_csdn.user
group by email
order by 2 desc
limit 10 offset 0;


-- 用户名和邮箱名相同的数据
select email,username
from db_csdn.user
where email=username;

