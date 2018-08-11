select 
    CU.cur_nombre CURSO, 
    COUNT(MA.alu_id) CANT_MAT,
    cu.cur_vacantes*cur_precio IMPORTE_COMPROMETIDO,
    SUM(pa.pag_importe) IMPORTE_RECAUADO
from educa.curso cu
join educa.MATRICULA ma on cu.cur_id=MA.cur_id 
JOIN educa.pago pa on cu.cur_id=pa.cur_id
group by CU.cur_nombre,cu.cur_vacantes*cur_precio;