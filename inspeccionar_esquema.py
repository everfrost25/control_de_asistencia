import re

content = open('database/schema.sql', encoding='utf-8').read()
pattern = r'CREATE TABLE `([^`]+)` \((.*?)\) ENGINE='
for match in re.finditer(pattern, content, re.S):
    name, ddl = match.groups()
    dependencies = re.findall(r'REFERENCES `([^`]+)`', ddl)
    print(f'{name}: {", ".join(dependencies) or "sin dependencias"}')
