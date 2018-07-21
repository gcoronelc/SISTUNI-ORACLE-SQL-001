SQL> conn recursos/admin
Conectado.

SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE
------------------------------ -----------
CARGO                          TABLE
CONTROL                        TABLE
DEPARTAMENTO                   TABLE
EMPLEADO                       TABLE
UBICACION                      TABLE

SQL> select * from cargo;

IDC NOMBRE               SUELDO_MIN SUELDO_MAX
--- -------------------- ---------- ----------
C01 Gerente General           15000      50000
C02 Gerente                   10000      15000
C03 Empleado                   7000      10000
C04 Analista                   5000       7000
C05 Vendedor                   3000       5000
C06 Oficinista                 1500       3000
C07 Programador                2500       6000
C08 Investigador               6000       8000
C09 Digitador                  1000       1500

9 filas seleccionadas.


