#! /bin/bash

INPUT=peoples.txt
id=1

for people in $(cat $INPUT)
do
name=$(echo $people | awk -F ',' '{print $1}')
lastname=$(echo $people | awk -F ',' '{print $2}')
age=$(shuf -i 20-50 -n 1)
mysql -u root -pmysql people -e "insert into register values ($id, '$name', '$lastname', $age)"
echo "$id, $name $lastname, $age updated successfully in DB"
let id=id+1
done
