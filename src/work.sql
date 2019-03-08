select *
from scott.dept;
select *
from scott.emp;
select *
from scott.salgrade;
# 1. 查找部门 30 中员工的详细信息
select * from scott.dept
where DEPTNO=30;
# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
select EMPNO,ENAME,MGR
from scott.emp where JOB='clerk';
# 3. 检索出奖金多于基本工资的员工信息
select LOSAL,HISAL from scott.salgrade
where LOSAL<HISAL;
# 4. 检索出奖金多于基本工资 30% 员工信息
select *
from emp where COMM>sal*0.03;
# 5. 希望看到 10 部门的经理或者 20 部门的职员 clerk 的信息
select *
from emp where DEPTNO=10 and JOB='manager' or DEPTNO=20 and JOB='CLERK';
# # 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是高于 2000 元的员工信息
select *
from emp where DEPTNO=10 and JOB='manager'and DEPTNO=20 and JOB='CLERK' or JOB!='manager'and JOB!='clerk'and sal>2000;
# 7. 找出获得奖金的员工的工作
select *
from emp where comm>0;
# 8. 找出奖金少于 100 或者没有获得奖金的员工的信息
select *
from scott.emp
where COMM<100 or COMM is null;
# 9. 查找员工雇佣日期是当月的最后一天的员工信息
