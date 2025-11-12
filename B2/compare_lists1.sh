echo noi dung trong file List_1.txt
cat list_1.txt

echo noi dung trong file List_2.txt
cat list_2.txt

echo So sanh 2 file list_1.txt vs list_2.txt

var=$(comm -23 list_1.txt list_2.txt)
echo = Noi dung bi thieu o list_2.txt $var 


