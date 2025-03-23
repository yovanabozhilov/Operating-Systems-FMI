#Напишете серия от команди, които изтриват:
#а) всички файлове в текущата директория и нейните поддиректории, които са с нулева дължина.
#б) 5-те най-големи файла в home директорията на текущия потребител и нейните поддиректории.

# a)
find . -type f -size 0 -delete
#or
rm -fv $(find . -mindepth 1 -type f -size 0)
#or
find . -size 0 -type f  -exec rm {} ';'

# b)
find ~ -type f -exec du -a {} \; | sort -n -r | head -n 5 | cut -f2 | xargs rm
#or
rm -fv $(find ~ -mindepth 1 -type f -printf "%p %s\n" 2>/dev/null | sort -k2nr | head -n5 | awk '{print $1}')
#or 
rm $(find ~ -type f -user $(whoami) -printf '%s %p\n' | sort -k 1 -rn | head -n 5 | cut -d ' ' -f 2)
