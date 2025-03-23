# Shell Script-овете са файлове, които по конвенция имат разширение .sh. Всеки
# такъв файл започва с "#!<interpreter>" , където <interpreter> указва на
# операционната система какъв интерпретатор да пусне (пр: "#!/bin/bash",
# "#!/usr/bin/python3 -u").

# Намерете всички .sh файлове в директорията `/usr` и нейните поддиректории, и
# проверете кой е най-често използваният интерпретатор.
 
find /usr/ -iname "*.sh" | xargs -I{} head -n 1 {} | grep "^#!" | tr -d " " | sort | uniq -c | sort -nr | head -n 1 | cut -d '!' -f2

#or

find /usr/ -iname '*.sh' -exec head -n 1 {} \; | grep "^#!" | cut -d "!" -f 2 | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
