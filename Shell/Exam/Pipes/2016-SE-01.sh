#Даден е текстов файл с име philip-j-fry.txt. Напишете shell script и/или серия от команди, които извеждат броя редове, съдържащи поне една четна цифра и несъдържащи малка
#латинска буква от a до w.
#Примерно съдържание на файла:
#123abv123
#123zz123
#MMU_2.4
#Примерен изход:
#Броят на търсените редовете е 2

#Серия от команди:
cat philip-j-fry.txt | grep -e '^[^a-w]*[2468][^a-w]*$' | wc -l
#или
cat philip-j-fry.txt | grep '[02468]' | grep -v '[a-w]' | wc -l
#или
cat philip-j-fry.txt | grep -E '[02468]' | grep -E -v '[a-w]' | wc -l

#Shell Script:
#!/bin/bash

if [ $# -ne 1 ];then
        echo "Invalid number of arguments"
        exit 1
fi

if ! [ -d  "${1}" ];then
        echo "Not a directory"
        exit 2
fi

while read -r file;do
        if ! [ -e "${file}" ];then
                echo "${file}"
        fi
done < <(find "${1}" -type l 2>/dev/null)
