/* 范式
    1NF：没有复义的列(加一列）
    2NF：行值不能被唯一区分（加主键)
    3NF：没有冗余的列，表中不能含有其它表的非主关键字值(添加表,且表与表存在主外键相连）
     */

 /*
 db_school
 department
 id,    title,   tel
 001,   cs,      010-12345678  (第一范式：一个字段只能存一个数据，不能再存手机号等)

student
id,    sno,  name,  gender,  ago,   deptName,  tel(最后两列列冗余）  deptID(FK)(此列是其他表的主关键字，不冗余）
1      null,  Tom,   male,    18      CS          010-123456            1
2      002,  Jerry, female,   18      CS          010-123456            1
3      null,  Tom,   male,    18      CS          010-123456            1
  */

/* 练习
1.电商网站
 db_ec
   tables
     -user(用户注册表)
     -product(商品表)
     -order(订单表)
 */
drop database if  exists db_ec;
create database db_ec;
show databases ;
drop table if exists db_ec.user;
create table db_ec.user(
  id int auto_increment  primary key comment 'id PK',
  email varchar(255) not null unique comment 'email NN UN',
  password  varchar(16) not null comment 'password NN',
  mobile varchar(15) not null unique comment 'mobile NN UN'
);

drop table if exists db_ec.user_info;
create table db_ec.user_info(
                         id int auto_increment  primary key comment 'id PK',
                         avatar varchar(255) comment 'avatar',
                         gender  char(2)  comment 'gender',
                         city varchar(15)  comment 'city',
                         userID int comment 'user id FK'
);
alter table db_ec.user_info
add constraint
user_info_fk_userID   -- table name_fk_foreign key
foreign key (userID)
references db_ec.user(id);

select *
from db_ec.user;

insert into db_ec.user(email, password, tel) VALUES ('Tom@163.com',123,123456789);
insert into db_ec.user(email, password, tel) VALUES ('Jerry@163.com',456,123456780);
insert into db_ec.user(email, password, tel) VALUES ('Test@163.com',789,123456781);


create table db_ec.product(
  clothes varchar(255)
);
















