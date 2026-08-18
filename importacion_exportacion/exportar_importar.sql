-- Exportar la tabla 'usuarios' a un archivo CSV
COPY usuarios TO 'C:/Users/Public/usuarios_export.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');

--  Importar datos desde el archivo CSV 
CREATE TEMP TABLE usuarios_prueba (LIKE usuarios INCLUDING ALL);
COPY usuarios_prueba FROM 'C:/Users/Public/usuarios_export.csv' WITH (FORMAT csv, HEADER, DELIMITER ',');


SELECT * FROM usuarios_prueba;