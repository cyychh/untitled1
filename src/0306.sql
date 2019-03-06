show databases;
create database db_school;
show tables from db_school;
create table db_school.student(
  Sno varchar(10) not null comment '学号',
  name varchar(15) comment '学生姓名',
  sex char(1) comment '性别',
  age int(2) comment '年龄'
);
create table db_school.course(
  cno varchar(10) comment '课程号',
  cname varchar(15) comment '课程名'
);
select * from db_school.student;
insert into db_school.student value ('001','小灰','男','20');
insert into db_school.student value ('002','小黄','男','21');
insert into db_school.student value ('003','小白','女','20');
insert into db_school.student value ('004','小黑','男','22');

insert into db_school.course value('1001','计算机');
insert into db_school.course value('1002','思想政治');
insert into db_school.course value('1003','高等数学');
select * from db_school.course;
create table db_school.sc(
  name varchar(15) not null  comment '姓名',
  cno varchar(10) not null comment '课程号',
  Sno varchar(10) not null comment '学号',
  primary key (Sno)
);
select * from db_school.sc;


