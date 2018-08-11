-- JOIN TABLAS
-- ==================

SELECT 
    dep.nombre DEPARTAMENTO, car.nombre CARGO, 
    COUNT(*) EMPS, SUM(SUELDO) PLANILLA
FROM RECURSOS.empleado EMP
JOIN RECURSOS.departamento DEP ON emp.iddepartamento = dep.iddepartamento
JOIN RECURSOS.cargo CAR ON emp.idcargo = car.idcargo
GROUP BY dep.nombre, car.nombre;


-- RETO
-- =====================
/*
Utilizando el esquema EDUCA, se necesita el siguiente reporte:

CURSO  CANT_MAT   IMPORTE          IMPORTE
                  COMPROMETIDO     RECAUDADO
-----------------------------------------------------


------------------------------------------------------

*/

select 
    CU.cur_nombre CURSO, 
    COUNT(MA.alu_id) CANT_MAT,
    sum(distinct ma.mat_precio) IMPORTE_COMPROMETIDO,
    SUM(nvl(pa.pag_importe,0)) IMPORTE_RECAUADO
from educa.curso cu
join educa.MATRICULA ma on cu.cur_id = MA.cur_id 
left JOIN educa.pago pa on ma.cur_id = pa.cur_id AND ma.alu_id = pa.alu_id
group by CU.cur_nombre;

SELECT * FROM EDUCA.matricula;

SELECT * FROM EDUCA.curso;

SELECT * FROM EDUCA.pago;


SELECT * 
FROM EDUCA.curso CUR
LEFT JOIN EDUCA.matricula MAT ON cur.cur_id = mat.cur_id;



WITH 
T1 AS (
    select ma.cur_id, 
    COUNT(*) MATRICULADOS,
    sum(ma.mat_precio) COMPROMETIDO
    from EDUCA.matricula ma 
    group by ma.cur_id
),
T2 AS (
    select pa.cur_id, sum(pa.pag_importe ) RECAUDADO
    from EDUCA.pago pa 
    group by pa.cur_id
)
SELECT 
    CU.cur_nombre, NVL(T1.MATRICULADOS,0) MATRICULADOS, 
    NVL(T1.COMPROMETIDO,0) COMPROMETIDO, NVL(T2.RECAUDADO,0) RECAUDADO 
FROM EDUCA.curso CU 
LEFT JOIN T1 ON CU.CUR_ID = t1.cur_id
LEFT JOIN T2 ON CU.CUR_ID = t2.cur_id;






