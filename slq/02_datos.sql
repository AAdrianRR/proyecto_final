-- 10 Usuarios
INSERT INTO usuarios (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos Gómez', 'carlos.gomez@example.com'),
('Ana Martínez', 'ana.martinez@example.com'),
('Luis Hernández', 'luis.hernandez@example.com'),
('Sofia Torres', 'sofia.torres@example.com'),
('Diego Ramírez', 'diego.ramirez@example.com'),
('Laura Flores', 'laura.flores@example.com'),
('Jorge Castillo', 'jorge.castillo@example.com'),
('Elena Morales', 'elena.morales@example.com');

-- 3 Técnicos
INSERT INTO tecnicos (nombre, especialidad) VALUES
('Roberto Redes', 'Infraestructura y Redes'),
('Marta Sistemas', 'Sistemas Operativos'),
('Pedro Software', 'Aplicaciones Software');

-- 10 Tickets
INSERT INTO tickets (usuario_id, tecnico_id, titulo, estado, prioridad) VALUES
(1, 1, 'Fallo en la conexión a red', 'Resuelto', 'Alta'),
(2, 2, 'Laptop no enciende', 'En Proceso', 'Alta'),
(3, 3, 'Error al abrir ERP', 'Pendiente', 'Media'),
(4, 1, 'Impresora sin configuración', 'Resuelto', 'Baja'),
(5, 2, 'Pantalla azul recurrente', 'En Proceso', 'Alta'),
(6, 3, 'Solicitud de licencia de Office', 'Cerrado', 'Baja'),
(7, 1, 'Caída del servidor local', 'Resuelto', 'Alta'),
(8, 2, 'Lentitud en el sistema', 'Pendiente', 'Media'),
(9, 3, 'Olvido de contraseña', 'Resuelto', 'Baja'),
(10, 1, 'Cable de red dañado', 'Pendiente', 'Baja');

-- 10 Comentarios
INSERT INTO comentarios (ticket_id, autor, mensaje) VALUES
(1, 'Juan Pérez', 'No tengo acceso a internet desde la mañana.'),
(1, 'Roberto Redes', 'Se reinició el switch del área.'),
(2, 'María López', 'La laptop parpadea en rojo.'),
(2, 'Marta Sistemas', 'Se agendó revisión física.'),
(3, 'Carlos Gómez', 'Muestra código de error 500.'),
(4, 'Ana Martínez', 'Necesito conectar la impresora de contabilidad.'),
(5, 'Luis Hernández', 'Sucedió al actualizar Windows.'),
(5, 'Marta Sistemas', 'Revisando volcados de memoria.'),
(7, 'Diego Ramírez', 'El servidor no responde al ping.'),
(7, 'Roberto Redes', 'Servicio restaurado exitosamente.');
