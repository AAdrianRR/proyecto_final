CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE tecnicos (
    tecnico_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE tickets (
    ticket_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES usuarios(usuario_id),
    tecnico_id INT REFERENCES tecnicos(tecnico_id),
    titulo VARCHAR(150) NOT NULL,
    estado VARCHAR(20) DEFAULT 'Pendiente' CHECK (estado IN ('Pendiente', 'En Proceso', 'Resuelto', 'Cerrado')),
    prioridad VARCHAR(10) DEFAULT 'Media' CHECK (prioridad IN ('Baja', 'Media', 'Alta')),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE comentarios (
    comentario_id SERIAL PRIMARY KEY,
    ticket_id INT NOT NULL REFERENCES tickets(ticket_id) ON DELETE CASCADE,
    autor VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_tickets_estado ON tickets(estado);