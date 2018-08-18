SELECT d.*, 
        (SELECT nvl(MIN(sal), 0) FROM  SCOTT.emp e WHERE e.deptno = d.deptno) MIN_SAL,
        (SELECT nvl(MAX(sal), 0) FROM  SCOTT.emp e WHERE e.deptno = d.deptno) MAX_SAL
FROM SCOTT.dept d;