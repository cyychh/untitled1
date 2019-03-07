show tables  from  db_school;
drop table db_school.student;
create table db_school.student(
    id     int auto_increment primary key comment 'id PK',
  -- 字段名 数据类型 [数据范围] [约束] 注释,
    sno    varchar(255) unique comment '学号',
    name   varchar(255) comment '学生姓名',
    age    int(2) comment '年龄',
    height double(3, 2) not null comment '身高 x.yz 米',
    dob    date comment '出生年月日 Date Of Birth',
    departmentID int comment '院系ID'
)comment '学生表';
drop table if exists db_school.department;
create table db_school.department(
  id int auto_increment primary key comment 'id pk',
  title varchar(255) comment '院系名称',
  tel varchar(255)comment '电话'
)comment '院系表';
select *
from db_school.department;

 -- 为学生版追加外键约束
alter table db_school.student
add constraint
student_fk_departmentID
foreign key (departmentID)
references db_school.department(id);
select *
from db_school.student;
desc db_school.student;
insert into db_school.student value (null,'001','Tom',19,1.7,'2008-1-1',1);
insert into db_school.student value (null,'002','Jerry',19,1.7,'2008-1-1',2);
insert into db_school.student value (null,'003','Tester',19,1.7,'2008-1-1',3);

update db_school.student
set dob='2003-3-1'
where name='Tom';
select * from db_school.student;
select *
from db_school.department;
insert into db_school.department value (null,'CS','010-12345678');
insert into db_school.department value (null,'SS','010-12345679');
insert into db_school.department value (null,'EE','010-12345680');
select s.name,d.title
from db_school.student s
inner join db_school.department d
on d.id=s.departmentID;