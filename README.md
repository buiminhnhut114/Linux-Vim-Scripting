🐧 Linux • Vim • Scripting – Assignment
1️⃣ Create File List

Create a file named list that contains all .v and .sv files of the Pulpissimo project.

2️⃣ Compare Two File Lists

Write a script that compares elements in two list files and outputs the number of files that are missing or extra.

📘 Example
list_1:
aaa.v
bbb.v
ccc.v

list_2:
aaa.v
bbb.v

🧾 Output
list_2 is missing 1 file: ccc.v
3️⃣ Change Path Script

Write a script named change_path that replaces a given path in a file with a new one.
(You may use any scripting language.)

📘 Example
./change_path.csh file_A home/spi/rtl_src home/spi/rtl_src_new
➡ Replace all path declarations of
home/spi/rtl_src
in file_A with
home/spi/rtl_src_new.
4️⃣ Regression Run Script

Write a script to run regression tests sequentially from a list and produce:

📄 Individual log files for each testcase

🧾 A summary report of all results

📘 Example
Input list
testlist:
TC1
TC2
TC3
TC4
TC5

Output files after running:
TC1.log
TC2.log
TC3.log
TC4.log
TC5.log
testlist.rpt

Report format (testlist.rpt)
TC1: PASS
TC2: FAIL
TC3: PASS
TC4: NA
TC5: PASS
Report directory: <path to TC*.log files>

PASS / FAIL / NA are determined from each .log file.
NA means the testcase could not be compiled or simulated.
