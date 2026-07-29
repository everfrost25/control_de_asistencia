"""Verificaciones repetibles de controles de calidad del repositorio.

No sustituye pruebas con PHP/MySQL: comprueba que los controles críticos
permanezcan presentes en el código fuente y alineados con el esquema SQL.
"""
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def text(relative_path: str) -> str:
    return (ROOT / relative_path).read_text(encoding='utf-8')

checks = {
    'sesion_con_csrf': ('app/session.php', 'csrf_token'),
    'sesion_con_regeneracion': ('app/session.php', 'session_regenerate_id(true)'),
    'consultas_preparadas': ('app/db.php', 'prepare($sql)'),
    'asistencia_sin_variable_indefinida': ('public/api/asistencia.php', "$registroPrevio['created_at']"),
    'asistencia_valida_estados': ('public/api/asistencia.php', "['Presente', 'Inasistente', 'Tardanza', 'Justificado']"),
    'asistencia_autoriza_docente': ('public/api/asistencia.php', "No tienes permiso para registrar la asistencia"),
    'asistencia_valida_estudiante_sesion': ('public/api/asistencia.php', 'unidad_didactica_id = ? AND seccion = ?'),
    'restablecimiento_no_predecible': ('public/api/usuarios.php', 'random_bytes(12)'),
    'docente_usa_perfil_academico': ('public/api/asistencia_docente.php', "WHERE usuario = ? AND estado = ?"),
    'asistencia_docente_alineada_esquema': ('public/api/asistencia_docente.php', 'docente_id, sesion_id, fecha, hora_ingreso, estado, registrado_por'),
    'asistencia_docente_estados_completos': ('public/api/asistencia_docente.php', "['Presente', 'Tardanza', 'Inasistente', 'Justificado']"),
    'integridad_unica_asistencia': ('database/schema.sql', 'UNIQUE KEY `uq_asistencia_estudiante_sesion`'),
    'integridad_unica_asistencia_docente': ('database/schema.sql', 'UNIQUE KEY `uq_asistencia_docente_sesion`'),
}

failed = []
for name, (file, expected) in checks.items():
    if expected in text(file):
        print(f'OK   {name}')
    else:
        print(f'FAIL {name}')
        failed.append(name)

if failed:
    raise SystemExit(f'{len(failed)} verificaciÃ³n(es) fallaron: {", ".join(failed)}')

print(f'APROBADO: {len(checks)} verificaciones estÃ¡ticas superadas.')
