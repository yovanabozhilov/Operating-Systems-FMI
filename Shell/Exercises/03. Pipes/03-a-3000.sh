#Запаметете във файл в своята home директория резултатът от командата `df -P`.
#Напишете команда, която извежда на екрана съдържанието на този файл, без първия ред (хедъра), сортирано по второ поле (numeric).

df -P > dfp
cat dfp | tail +2 | sort -k 2 -n