echo Tim kiem file .v 
find . -type f -name "*.v"
echo Xuat file ra list_1.txt
find . -type f -name "*.v" > list_1.txt


echo Tim kiem file .sv
find . -type f -name "*.sv"
echo Xuat file ra list_2.txt
find . -type f -name "*.sv*" > list_2.txt

echo Tim kiem file .v va .sv
find . -type f \( -name "*.v*" -o -name "*.sv*" \)
echo Xuat file ra list_3.txt
find . -type f \( -name "*.v*" -o -name "*.sv*" \) > list_3.txt
