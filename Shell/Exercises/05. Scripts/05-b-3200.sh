#!/bin/bash

#v1
if [[ ${#} -ne 1 ]] ; then
        echo "Expected 1 argument - folder path"
        exit 1
fi

if [[ ! -d ${1} ]] ; then
        echo "Invalid folder path"
        exit 1
fi


filesCount=$(find "${1}" -mindepth 1 -type f 2>&1 | wc -l)
directoriesCount=$(find "${1}" -mindepth 1 -type d 2>&1 | wc -l)

echo "Files: ${filesCount}"
echo "Directories: ${directoriesCount}"
echo Total count: $((filesCount + directoriesCount))

#v2

read -p "Enter directory name: " dirName

if [[ ! -d ${dirName} ]] ; then
        echo "Directory does not exist"
        exit 1
fi

filesCount=$(find "${dirName}" -mindepth 1 -type f | wc -l)
directoriesCount=$(find "${dirName}" -mindepth 1 -type d | wc -l)

echo "Files: ${filesCount}"
echo "Directories: ${directoriesCount}"

#Да се напише shell скрипт, който приканва потребителя да въведе пълното име на директория и извежда на стандартния
#изход подходящо съобщение за броя на всички файлове и всички директории в нея.