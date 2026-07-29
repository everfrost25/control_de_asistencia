# Calidad de Software del Proyecto

Este documento resume la evidencia disponible en el repositorio para:

- Aseguramiento de la Calidad de Software (SQA)
- Control de Calidad de Software (SQC)
- Énfasis especial en Usabilidad

También cubre los siguientes procesos de calidad:
- Revisión de requisitos
- Inspección de diseño y documentación
- Revisión de código
- Pruebas de software
- Verificación de defectos
- Seguimiento de incidencias
- Auditoría de calidad
- Medición con métricas
- Validación con el usuario

## 1. Aseguramiento de la Calidad de Software (SQA)

Evidencia disponible:
- `tests/verificacion_estatica.py` contiene comprobaciones repetibles de controles críticos.
- `documentos_extraidos.txt` describe el plan de pruebas, matriz de casos de prueba y auditoría de calidad.
- `README.md` documenta el propósito y las funcionalidades del sistema.

Descripción:
- El repositorio incluye artefactos orientados a verificar que el software cumple con los requisitos de seguridad, integridad y trazabilidad.
- Los roles de Tester/QA y las actividades de prueba están descritos en la documentación.

## 2. Control de Calidad de Software (SQC)

Evidencia disponible:
- Uso de consultas preparadas en `app/db.php` y `public/api/*`.
- Verificación de integridad de datos en `database/schema.sql` (claves únicas y estructura relacional).
- Validaciones y permisos en `public/api/asistencia.php`, `public/api/usuarios.php` y otros endpoints.
- Código de la interfaz en `public/layout.php` y los módulos con diseño consistente.

Descripción:
- El proyecto aplica controles técnicos de calidad sobre la base de datos y el backend.
- El script de verificación estática proporciona un control sistemático sobre puntos críticos del código.

## 3. Usabilidad

Evidencia disponible:
- Interfaz basada en Tailwind CSS, con navegación clara, menús y filtros.
- `public/layout.php` muestra un diseño de sidebar y contenido organizado.
- Requisitos en `documentos_extraidos.txt` incluyen `RNF-01` sobre interfaz intuitiva y clara.

Descripción:
- Hay un enfoque visible en usabilidad mediante elementos de navegación legibles, dashboard e indicadores.
- Se han incluido mejoras para facilitar el uso de la barra lateral y el acceso a submenús.

## 4. Checklist de procesos adicionales

### Revisión de requisitos
- `documentos_extraidos.txt` menciona requisitos funcionales y no funcionales.
- Se identifican RF y RNF relevantes, incluido el requisito de usabilidad.

### Inspección de diseño y documentación
- La documentación describe la arquitectura y el alcance del sistema.
- El README y los documentos extraídos reflejan planificación y criterios de aceptación.

### Revisión de código
- `tests/verificacion_estatica.py` comprueba prácticas de seguridad y datos.
- El repositorio tiene ejemplos de refactorización lógica, validación y manejo de errores en PHP.

### Pruebas de software
- El proyecto cuenta con un script repetible de verificación estática.
- La documentación describe ejecución de pruebas funcionales y regresión.

### Verificación de defectos
- `documentos_extraidos.txt` trata la identificación, clasificación y corrección de errores.
- El README y los scripts muestran atención a bugs detectados y su corrección.

### Seguimiento de incidencias
- El texto de documentación describe un flujo de incidencia: Nuevo → En análisis → En corrección → En prueba → Cerrado/Reabierto.

### Auditoría de calidad
- La documentación menciona auditoría interna y checklist de cumplimiento.
- Hay ejemplos de revisión de seguridad, permisos y trazabilidad.

### Medición con métricas
- El repositorio incluye métricas operativas implícitas en dashboards y resultados de verificación.
- La documentación indica objetivos de tasa de aprobación y métricas de calidad.

### Validación con el usuario
- La validación con el usuario es un resultado esperado del proceso de calidad.
- Para completar este punto, se recomienda documentar la aceptación con al menos un administrador, docente y estudiante.

## 5. Recomendaciones para completar la evidencia

1. Incluir un documento formal de plan de pruebas con casos y resultados.
2. Añadir un registro de incidencias/defectos dentro del repositorio.
3. Documentar la validación de usuario final con sus resultados.
4. Mantener la matriz de requisitos trazable a casos de prueba.

---

Este documento complementa el repositorio para mostrar el enfoque en SQA, SQC y usabilidad, y servir como base de evidencia para los procesos de calidad.
