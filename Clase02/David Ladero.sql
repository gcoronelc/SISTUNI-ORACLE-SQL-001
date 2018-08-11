SELECT 
    cur.cur_nombre, 
    COUNT(mat.alu_id) CANT_MAT, 
    SUM(mat.mat_precio) IMP_COMPROMETIDO, 
    SUM(pa.pag_importe) IMP_RECAUDADO
FROM EDUCA.curso CUR 
JOIN EDUCA.matricula MAT ON cur.cur_id = mat.cur_id
JOIN EDUCA.pago PA ON MAT.alu_id = pa.alu_id
GROUP BY cur.cur_nombre
;