"""Reordena el dump SQL por dependencias de claves foráneas.

Cada bloque conserva su CREATE TABLE y sus datos semilla; solo cambia el
orden para que las tablas padre existan antes de las tablas hijas.
"""
from pathlib import Path
import re

path = Path('database/schema.sql')
content = path.read_text(encoding='utf-8')
marker = '-- ------------------------------------------------------------\n-- Table: `'
parts = content.split(marker)
header = parts[0]
blocks = {}
tail = ''
for part in parts[1:]:
    name, rest = part.split('`', 1)
    if '\nSET FOREIGN_KEY_CHECKS = 1;' in rest:
        rest, tail = rest.split('\nSET FOREIGN_KEY_CHECKS = 1;', 1)
        tail = '\nSET FOREIGN_KEY_CHECKS = 1;' + tail
    blocks[name] = marker + name + '`' + rest

order = [
    'configuracion', 'periodos_academicos', 'programas', 'respaldos', 'usuarios',
    'modulos_formativos', 'periodos_curriculares', 'unidades_didacticas',
    'docentes', 'estudiantes', 'sesiones', 'asistencia_docentes', 'asistencias',
    'auditoria', 'auditoria_asistencias', 'horarios',
]
missing = set(blocks) - set(order)
if missing:
    raise SystemExit(f'Bloques no ordenados: {sorted(missing)}')
if len(blocks) != len(order):
    raise SystemExit('La cantidad de bloques no coincide con el orden esperado.')

path.write_text(header + ''.join(blocks[name] for name in order) + tail, encoding='utf-8', newline='\n')
print('schema.sql reorganizado:', ' -> '.join(order))
