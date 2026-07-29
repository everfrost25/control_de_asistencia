-- Migración no destructiva para instalaciones existentes.
-- Realizar una copia de seguridad antes de ejecutarla.

ALTER TABLE asistencia_docentes
    ADD COLUMN sesion_id INT NULL AFTER docente_id,
    ADD COLUMN hora_ingreso TIME NULL AFTER fecha;

UPDATE asistencia_docentes ad
JOIN sesiones s
  ON s.docente_id = ad.docente_id
 AND s.fecha = ad.fecha
SET ad.sesion_id = s.id,
    ad.hora_ingreso = COALESCE(ad.hora_ingreso, s.hora);

-- Verificar primero que la siguiente consulta no devuelva filas.
-- SELECT * FROM asistencia_docentes WHERE sesion_id IS NULL OR hora_ingreso IS NULL;

ALTER TABLE asistencia_docentes
    MODIFY COLUMN sesion_id INT NOT NULL,
    MODIFY COLUMN hora_ingreso TIME NOT NULL,
    MODIFY COLUMN estado ENUM('Presente','Inasistente','Tardanza','Justificado') NOT NULL,
    ADD UNIQUE KEY uq_asistencia_docente_sesion (docente_id, sesion_id),
    ADD KEY asistencia_docentes_sesion_id (sesion_id),
    ADD CONSTRAINT asistencia_docentes_ibfk_2
        FOREIGN KEY (sesion_id) REFERENCES sesiones(id)
        ON DELETE CASCADE ON UPDATE CASCADE;
