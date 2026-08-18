-- 1. Crear usuario de Consulta (Solo Lectura)
CREATE USER usr_consulta WITH PASSWORD 'PassConsulta123!';
GRANT CONNECT ON DATABASE helpdesk_db TO usr_consulta;
GRANT USAGE ON SCHEMA public TO usr_consulta;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_consulta;

-- 2. Crear usuario de Captura (Lectura e Insercion)
CREATE USER usr_captura WITH PASSWORD 'PassCaptura123!';
GRANT CONNECT ON DATABASE helpdesk_db TO usr_captura;
GRANT USAGE ON SCHEMA public TO usr_captura;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO usr_captura;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO usr_captura;