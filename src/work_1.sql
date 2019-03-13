select *
from scott.dept;
select *
from scott.emp;
select *
from scott.salgrade;

# 1. 返回拥有员工的部门名、部门号
select distinct scott.dept.DEPTNO,dept.DNAME
from dept inner join emp
on dept.DEPTNO=emp.DEPTNO;

# 2. 工资多于 scott 的员工信息
select *
from emp where SAL>(select sal from emp where ENAME='scott');

# 3. 返回员工和所属经理的姓名?
select e1.ENAME,e2.ENAME from emp e1,(select EMPNO,ENAME from emp where job='manager')e2
where e1.MGR=e2.EMPNO;

# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select emp.ENAME,e2.ENAME from emp ,(select EMPNO,ENAME,HIREDATE from emp where job ='manager')e2
where emp.EMPNO and emp.HIREDATE<e2.HIREDATE;

# 5. 返回员工姓名及其所在的部门名称
select distinct scott.emp.ENAME,dept.dname
from dept inner join emp
on dept.DEPTNO = emp.DEPTNO;

# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select distinct scott.emp.ENAME,dept.DNAME
from dept inner join emp
on dept.DEPTNO = emp.DEPTNO and emp.JOB='clerk';

# 7. 返回部门号及其本部门的最低工资
select DEPTNO,min(SAL) from emp group by DEPTNO;

# 8. 返回销售部 sales 所有员工的姓名
select DEPTNO from dept where DNAME='sales';
select *
from emp where DEPTNO=(select DEPTNO from dept where DNAME='sales');

# 9. 返回工资多于平均工资的员工
select *
from emp where SAL>(select avg(SAL) from emp);

# 10. 返回与 scott 从事相同工作的员工
select *
from emp where job=(select job from emp where ENAME='scott');

# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
  select ENAME,DEPTNO,SAL
  from emp where SAL >(select avg(sal) from emp where DEPTNO=30) ;

# 12. 返回工资高于30部门所有员工工资的员工信息
select *
from emp where SAL>(select max(SAL)from emp where DEPTNO=30);

# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
select dept.DEPTNO,dept.DNAME,dept.loc,
count(emp.DEPTNO)number from dept,emp
where dept.DEPTNO=emp.DEPTNO
group by emp.DEPTNO;

# 14. 返回员工的姓名、所在部门名及其工资
select emp.ENAME,dept.dname,SAL from emp,dept
where emp.deptno=dept.deptno;

# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
select e1.*
from emp e1,emp e2
where e1.DEPTNO!=e2.DEPTNO and e1.JOB=e2.JOB;

select a.* from emp a,emp b
where a.job=b.job and a.deptno<>b.deptno;

# 16. 返回员工的详细信息，包括部门名
select e.* ,d.DNAME from emp e,dept d
where e.DEPTNO=d.DEPTNO;

# 17. 返回员工工作及其从事此工作的最低工资
select JOB,min(SAL)
from emp group by JOB;

# 18. 返回不同部门经理的最低工资
select DEPTNO,min(SAL)
from emp group by DEPTNO;
# 19. 计算出员工的年薪，并且以年薪排序
# 20. 返回工资处于第 4 级别的员工的姓名