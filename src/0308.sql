select *
from db_school.student;

delete from db_school.student;

show full columns from db_school.student;
show full tables from db_school;
show variables like 'c%';
select *
from scott.emp;
drop table student;
select EMPNO,HIREDATE -- 投影
from scott.emp;
select distinct JOB -- 查找唯一约束
from scott.emp;
select *
from scott.emp
# where sal>2000;
# where sal<>3000 and job<>'salesman' ; -- 不等于3000而且不是工种不是salesman
where sal<>3000 or job<>'salesman';-- 不等于3000或者工种不是salesman

--  ci:大小写不敏感 查询时不区分大小写
select *
from scott.emp
where ENAME=binary 'Scott';

-- 排序
select job,ENAME,HIREDATE
from scott.emp
# order by ENAME asc;  -- 按员工姓名升序排列（默认）
# order by ENAME desc ;-- 按员工姓名降序排列
# order by HIREDATE; -- 按工龄升序排列
order by job,ENAME; -- 先按Job排序，再按ename排序

select COMM
from scott.emp
order by COMM;  -- 排序时空值最小，排最前

-- limit
select *
from scott.emp
limit 3 offset 0; -- offset 偏移量  分批  一批显示一部分数据(此处三个数据一显示）
# limit 0,3;  -- 简写方式（0为第一个数据，3为一批显示的数据量）

-- like 模糊查询
select ENAME from scott.emp
# where ENAME like 'a%';
# where ENAME not like 'a%s'; -- 不能a开头且s结尾
# where ENAME like '_cott'; -- 下划线_表示一个任意字符
where ENAME like '%\%' escape '\\';

select *
from scott.emp
# where JOB='salesman' or JOB ='manager' or JOB ='president';
where job in ('salesman','manager','president');

select *
from scott.emp
# where SAL>=2000 and SAL<=3000;
where SAL between 2000 and 3000;  -- between 为闭区间（包含2000和3000）

-- 起别名
select ENAME as 员工姓名
from scott.emp;
select e.ENAME as 员工姓名
from scott.emp as e ;

select *
from scott.emp
where COMM is null;

update scott.emp -- DML
set comm = null
where EMPNO='7499';

-- 计算员工总收入
select ENAME,sal+ifnull(COMM,0) -- 如果奖金空，工资加0；奖金不为0，工资加奖金
from scott.emp;

select e.ENAME,e.DEPTNO,d.DNAME,d.DEPTNO
from scott.emp e inner join  scott.dept d  -- inner join 内部连接(可省略inner）
on e.DEPTNO=d.DEPTNO;

-- 运行后共52条数据（13*4）

-- 内部连接基础之上显示落选的数据
select e.ENAME,d.DNAME
from scott.emp e left outer join scott.dept d   -- 左外连接(outer可省略）显示KING
on e.DEPTNO =d.DEPTNO
union  -- 连接左右外连接，KING和OPERTIONS都显示
select e.ENAME,d.DNAME
from scott.emp e right outer join scott.dept d  -- 右外连接 显示OPERTIONS
on e.DEPTNO=d.DEPTNO;





