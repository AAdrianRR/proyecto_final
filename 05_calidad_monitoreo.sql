-- Monitoreo: Revisar conexiones activas en la base de datos
SELECT pid, usename, client_addr, state, query 
FROM pg_stat_activity 
WHERE datname = 'helpdesk_db';

--  Monitoreo: Consultar el tamaño total de la base de datos
SELECT pg_size_pretty(pg_database_size('helpdesk_db')) AS tamaño_bd;

--  Monitoreo: Analizar el plan de ejecución de una consulta
EXPLAIN ANALYZE 
SELECT * FROM tickets WHERE estado = 'Pendiente';

--  Calidad de Datos: Identificar correos con formato potencialmente inválido o nulos
SELECT usuario_id, nombre, email 
FROM usuarios 
WHERE email NOT LIKE '%@%.%' OR email IS NULL;

--  Calidad de Datos: Identificar tickets huérfanos o sin técnico asignado
SELECT ticket_id, titulo, estado 
FROM tickets 
WHERE tecnico_id IS NULL;