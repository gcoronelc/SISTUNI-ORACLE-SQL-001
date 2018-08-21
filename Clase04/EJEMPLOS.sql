-- RULLUP
-- ======


SELECT deptno, job, SUM(sal) PLANILLA
FROM scott.emp
GROUP BY ROLLUP(deptno, job);

SELECT deptno, job, SUM(sal) PLANILLA
FROM scott.emp
GROUP BY ROLLUP(deptno, job), ROLLUP(deptno);

SELECT deptno, job, SUM(sal) PLANILLA
FROM scott.emp
GROUP BY ROLLUP(deptno, job), ROLLUP(deptno);



-- CUBE
-- ======


SELECT deptno, job, SUM(sal) PLANILLA
FROM scott.emp
GROUP BY CUBE(deptno, job);

SELECT deptno, job, SUM(sal) PLANILLA
FROM scott.emp
GROUP BY CUBE(deptno, job), CUBE(job);

SELECT deptno, job, SUM(sal) PLANILLA
FROM scott.emp
GROUP BY CUBE(deptno, job), CUBE(deptno), CUBE(job);

