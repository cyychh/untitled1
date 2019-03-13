show databases ;

create table scott.new_emp
select *
from scott.emp;

select *
from scott.emp;

delete from scott.new_emp;
insert into scott.new_emp
(EMPNO, ENAME,DEPTNO)
select EMPNO, ENAME,DEPTNO
from scott.emp;

create or replace view scott.v_emp
as
select ENAME,JOB,DEPTNO
from scott.emp
where DEPTNO=30;

select *
from scott.v_emp;

select ename,dname
from scott.emp e inner join scott.dept d
  on e.deptno=d.deptno
where ename='Allen';

select *
from scott.v_emp
where ENAME='allen';

start transaction ;
delete
from scott.emp
where ENAME='allen';

select *
from scott.emp;

rollback ; -- 回滚
commit ; -- 提交

# select avg(sal)
# select sum(sal)
# select min(sal),max(sal)
# select count(*)  -- 表一共多少条记录
select sum(ename) -- 可以运行 但无意义
from scott.emp;

-- 分组查询
select deptno,avg(sal)
from scott.emp
group by deptno;  -- group by  按deptno分组查询

select job,max(HIREDATE)
from scott.emp
group by job -- 按job工种分组
having JOB in ('clerk','manager');  -- having 对组进行检索/where 行检索/投影 列检索

select abs(-1);  -- 绝对值
select bin(-1); -- 二进制值
select pi();
select rtrim('   test   '); -- 去掉右边空格
select ltrim('   test   '); -- 去掉左边空格
select trim('   test   '); -- 两边空格都去掉

select lower(ENAME)
from scott.emp;

-- 日期函数
select current_date;  -- 当前日期
select now();  -- 当前时间
select date_add(now(),interval 1 week );  -- 现在之后一周之后的时间
select dayofweek(now()); -- 今天是一个星期中的第几天（周日是第一天，周六是第七天）
select week(now()); -- 今天是一年中的第几周

select inet_aton('166.111.3.107'); -- inet:internet    aton:adress to number

select *
from db_ip.ip
where inet_aton('166.111.3.207')between inet_aton(min) and inet_aton(max);







