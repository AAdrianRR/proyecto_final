-- 1. Consulta con JOIN: Obtener tickets con el nombre del usuario y técnico asignado
SELECT t.ticket_id, u.nombre AS usuario, t.titulo, t.estado, te.nombre AS tecnico
FROM tickets t
JOIN usuarios u ON t.usuario_id = u.usuario_id
LEFT JOIN tecnicos te ON t.tecnico_id = te.tecnico_id;

-- 2. Conteo de tickets agrupados por su estado actual
SELECT estado, COUNT(*) AS total_tickets
FROM tickets 
GROUP BY estado;

-- 3. Filtrar tickets de prioridad Alta que aún están Pendientes
SELECT * FROM tickets 
WHERE prioridad = 'Alta' AND estado = 'Pendiente';

-- 4. Obtener el historial completo de comentarios de un ticket en particular
SELECT c.comentario_id, c.autor, c.mensaje, c.fecha
FROM comentarios c
WHERE c.ticket_id = 1
ORDER BY c.fecha ASC;

-- 5. Obtener el total de tickets asignados a cada técnico
SELECT te.nombre AS tecnico, COUNT(t.ticket_id) AS total_asignados
FROM tecnicos te
LEFT JOIN tickets t ON te.tecnico_id = t.tecnico_id
GROUP BY te.nombre;