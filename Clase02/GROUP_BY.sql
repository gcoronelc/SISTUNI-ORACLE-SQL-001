
SELECT * FROM RECURSOS.empleado;

SELECT SUM(SUELDO) FROM RECURSOS.empleado;

SELECT iddepartamento, SUM(SUELDO) planilla
FROM RECURSOS.empleado
GROUP BY iddepartamento;


SELECT iddepartamento, count(idempleado) empleados
FROM RECURSOS.empleado
GROUP BY iddepartamento
HAVING count(idempleado) > 5;


SELECT 
    iddepartamento, idcargo, 
    COUNT(*) EMPS, SUM(SUELDO) PLANILLA
FROM RECURSOS.empleado
GROUP BY iddepartamento, idcargo;

