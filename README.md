# Linux-Vim-Scripting — Assignments

This repository contains four Linux & scripting exercises focused on RTL file listing, list comparison, path replacement, and regression runs.

## 1) Create a list of all `.v` and `.sv` files in **PULPissimo**
Create a file named `pulpissimo_files.list` that contains every `.v` and `.sv` file under the PULPissimo project directory, one path per line.

---

## 2) Compare two list files
Write a script that compares two list files (`list_1` and `list_2`) and reports:
- Files **missing** in `list_2` (present in `list_1` but not in `list_2`)
- Files **extra** in `list_2` (present in `list_2` but not in `list_1`)
- The **counts** of missing and extra files

**Example**
list_1: aaa.v bbb.v ccc.v
list_2: aaa.v bbb.v
⇒ list_2 is missing 1 file: ccc.v

---

## 3) `change_path` — replace paths inside a file
Write a script `change_path` that replaces all occurrences of a given source path with a target path within a specified file.

**Example**
./change_path.csh file_A home/spi/rtl_src home/spi/rtl_src_new
This replaces all `home/spi/rtl_src` entries in `file_A` with `home/spi/rtl_src_new`.

---

## 4) Regression runner
Write a script that:
- Reads a `testlist` (each line is a testcase name, e.g., `TC1`, `TC2`, …)
- Runs each testcase sequentially
- Produces per-test logs: `TC1.log`, `TC2.log`, …
- Generates a summary report `testlist.rpt` with `PASS/FAIL/NA` for each testcase  
  (`NA` is used when a testcase cannot compile or cannot run simulation)

**Example**


testlist: TC1 TC2 TC3 TC4 TC5

Outputs:
TC1.log TC2.log TC3.log TC4.log TC5.log testlist.rpt

testlist.rpt:
TC1: PASS
TC2: FAIL
TC3: PASS
TC4: NA
TC5: PASS
Report directory : <path to the TC*.log files>



---

## Collaboration
Developed with collaboration and support from **[@tedduy](https://github.com/tedduy)**.

## License
MIT (or update to your preferred license).
