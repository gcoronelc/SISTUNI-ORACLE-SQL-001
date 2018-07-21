where
paterno like case 
	when p_paterno is null then paterno
	else '%' || p_paterno || '%' end
and materno like case 
	when p_materno is null then materno
	else '%' || p_materno || '%' end
and nombre like case 
	when p_nombre is null then nombre
	else '%' || p_nombre || '%' end

	