-- Subconsulta correlacionada
select d.*, 
(select count(*) from scott.emp e where e.deptno = d.deptno) emps,
(select count(*) from scott.emp e ) total,
(select count(*) from scott.emp e where e.deptno = d.deptno) * 100.0 
/ (select count(*) from scott.emp e ) porc
from SCOTT.dept d;

-- subconsulta tabla derivada
select d1.*, nvl(d2.emps, 0) emps
from SCOTT.dept d1
left join (select deptno, count(*) emps from scott.emp group by deptno) d2
on d1.deptno = d2.deptno;

-- SUBCONSULTA ESCALAR
SELECT *
FROM SCOTT.EMP
WHERE SAL = (SELECT MIN(SAL) FROM SCOTT.EMP);

-- EJERCICIO
-- QUIENES TIENEN EL MENOR Y MAYOR SALARIO POR DEPARTAMENTO.

WITH 
V1 AS (
    SELECT deptno, 'MAX' tipo, sal, empno, ename
    FROM SCOTT.EMP 
    WHERE (deptno, sal) in (
        select deptno, max(sal) from scott.emp group by deptno) ),
V2 AS (
    SELECT deptno, 'MIN' tipo, sal, empno, ename
    FROM SCOTT.EMP 
    WHERE (deptno, sal) in (
        select deptno, min(sal) from scott.emp group by deptno) )
select d.deptno, d.dname, v.tipo, v.sal, v.empno, v.ename 
from scott.dept d
join ( select * from v1 union select * from v2) v
on d.deptno = v.deptno
order by 1;

-- EJEMPLO CON CASE
/*
RSUMEN DE MOVIMIENTOS POR SUCURSAL Y POR MONEDA

COD.       NOM.        N.MOV.   IMPORTE  N.MOV.   IMPORTE
SUCURSAL   SUCURSAL    SOLES    SOLES    DOLARES  DOLARES
--------------------------------------------------------------
001       
002        
--------------------------------------------------------------
*/

SELECT c.chr_sucucodigo,
    SUM(CASE WHEN C.CHR_MONECODIGO='01' THEN 1 ELSE 0 END) MOV_SOLES,
    SUM(CASE WHEN C.CHR_MONECODIGO='01' THEN m.dec_moviimporte ELSE 0 END) IMP_SOLES,
    SUM(CASE WHEN C.CHR_MONECODIGO='02' THEN 1 ELSE 0 END) MOV_SOLES,
    SUM(CASE WHEN C.CHR_MONECODIGO='02' THEN m.dec_moviimporte ELSE 0 END) IMP_DOLARES
FROM EUREKA.cuenta C
JOIN EUREKA.movimiento M ON c.chr_cuencodigo = m.chr_cuencodigo
GROUP BY c.chr_sucucodigo;






SELECT *
FROM EUREKA.cuenta C
JOIN EUREKA.movimiento M ON c.chr_cuencodigo = m.chr_cuencodigo;




















    
    
    
    



