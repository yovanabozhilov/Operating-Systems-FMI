#Копирайте всички файлове от /etc, които могат да се четат от всички, в
#директория myetc в home директорията ви. Направете такава, ако нямате.

mkdir -p ~/myetc
find /etc/ -perm /u+r,g+r,o+r -exec cp -r {} myetc/ \;

#or

cp -r $(find /etc/ -perm /o+w,g+w,u+w) ~/myetc/


