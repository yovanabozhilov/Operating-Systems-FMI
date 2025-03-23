#Намерете имената на топ 5 файловете в текущата директория с най-много hardlinks.

find . -printf '%p %n\n' | sort -n -r -k 2 | head -n 5 | cut -d ' ' -f 1
#or
find . -maxdepth 1 -type f -printf '%n %p\n' | sort -k 1 -rn | head -n 5 | cut -d ' ' -f 2
#or
find ~ -type f | xargs -I{} stat -c "%h %n" {} | sort -k 1nr -t ' ' | head -n 5 | cut -d ' ' -f2
#or
find . -type f | xargs -I{} stat -c "%h %n" {} | sort -k1nr | head -n 5 | awk '{print $2}'

