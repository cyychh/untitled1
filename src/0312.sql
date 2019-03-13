-- 索引
/* show index from scott.emp;

create index idx_ename on scott.emp(ENAME);
drop index idx_ename on scott.emp;

create index ind_password on db_csdn.user(password);
select *
from scott.emp;
 */


-- - --------------------------------------------------

drop database if exists db_a;
create database db_a;
drop table if exists db_a.user;
create table db_a.user(
  id int auto_increment primary key comment 'id PK',
  username varchar(255) not null comment 'username NN',
  password varchar(255) not null comment 'password NN',
  role int(1) not null default 0 comment 'role 0-student 1-admin NN'
)comment 'user table';

drop table if exists db_a.activity;
create table db_a.activity(
   id int auto_increment primary key comment 'id PK',
   title varchar(255) not null comment 'activity title NN'
)comment 'activity table';

drop table if exists db_a.enroll;
create table db_a.enroll(
  id int auto_increment primary key comment 'id FK',
  time datetime not null default now() comment 'enroll time NN',
  userID varchar(255) not null comment 'user id FK',
  activityID varchar(255) not null comment 'activity id FK'
)comment 'enroll table';

alter table db_a.enroll
  add constraint
    enroll_fk_userId
    foreign key (userId)
      references db_a.user (id);

alter table db_a.enroll
  add constraint
    enroll_fk_activityId
    foreign key (activityId)
      references db_a.activity (id);

insert into db_a.user value (null,'admin',md5('123'),1);

select *
from db_a.user
where username='admin' and password=md5('123');

-- create
insert into db_a.activity value (null,'植物园一日游');
insert into db_a.activity value (null,'动物园一日游');

delete from db_a.activity where id=1;

update db_a.activity
set title=''
where id=1;

select *
from db_a.activity;

insert into db_a.user(username,password)
values ('Tom',md5('abc'));
insert into db_a.user(username,password)
values ('Jerry',md5('def'));
#insert into db_a.user(username,password)
#values ('Test',md5('ghi'));

select *
from db_a.user
where username='Jerry'
and password=md5('def');

/*delete from db_a.user;
set foreign_key_checks =0;
set foreign_key_checks =1;
truncate db_a.user;  -- 一旦执行无法找回*/

-- sthuent
insert into db_a.enroll (id,userID, activityID)
values (null,2,1);
insert into db_a.enroll (id,userID, activityID)
values (null,3,2);

-- admin sign in retrieve
select u.username,a.title
from db_a.user u inner join db_a.enroll e
on u.id=e.userID
inner join db_a.activity a
on e.activityID=a.id;

select u.username,a.title
from db_a.user u inner join db_a.enroll e
                            on u.id=e.userID
                 inner join db_a.activity a
                            on e.activityID=a.id
                            where a.id=1;

select *
from db_a.user;

select *
from db_a.enroll;


