#!/bin/bash

max_time=0
max_file=""
max_user=""

for file in $(cat /etc/passwd | awk -F ':' '{print $1 " " $6}') ; do
    user=$(echo ${file} | awk '{print $1}')
    dir=$(echo ${file} | awk '{print $2}')
    time_file=$(find ${dir} -type f -printf "%T@ %p" 2>/dev/null | sort -k1nr | head -n1)
    time=$(echo "${time_file}" | awk '{print $1}')
    t_file=$(echo "${time_file}" | awk '{print $2}')
    if [[ ${time} > ${max_time} ]] ; then
                max_time=${time}
                max_file=${t_file}
                max_user=${user}
    fi
done

echo "${max_user} ${max_file}"


#Напишете серия от команди, които от файла /etc/passwd да вземат под-низ, състоящ
#се от втора и трета цифра на факултетния номер на студентите от специалност Информатика,
#чиито фамилии завършват на “а”. Изведете коя комбинация от цифри се среща най-често и коя е
#тя.
#Примерно съдържание на файла:
#s45194:x:1255:502:Elizabet Mihaylova, Inf, k3, g1:/home/Inf/s45194:/bin/bash
#s45139:x:1261:502:Vasilena Peycheva:/home/Inf/s45139:/bin/bash
#s81257:x:1079:503:Vasilena Nikolova, KN, 2kurs, 5gr:/home/KN/s81257:/bin/bash
#s81374:x:1117:503:Ivan Kamburov, KN, 2kurs, 7gr:/home/KN/s81374:/bin/bash
#kiril:x:508:500:Kiril Varadinov:/home/kiril:/bin/bash
#s61812:x:1128:504:Vladimir Genchev:/home/SI/s61812:/bin/bash
#user:x:1000:99:Inactive user just to start UID from 1000:/home/user:/sbin/nologin
#s81254:x:1077:503:Mariela Tihova, KN, 2kurs, 5gr:/home/KN/s81254:/bin/bash
#s81386:x:1121:503:Daniela Ruseva, KN, 2kurs, 7gr:/home/KN/s81386:/bin/bash
#s45216:x:1235:502:Aleksandar Yavashev, Inf, k3, g3:/home/Inf/s45216:/bin/bash
#Примерен изход:
#2 51