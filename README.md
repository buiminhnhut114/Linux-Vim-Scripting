# 🧠 Linux-Vim-Scripting — Assignments

This repository contains four scripting exercises for Linux users, focusing on RTL file listing, list comparison, path replacement, and regression automation.

---

## 1) Generate a list of all `.v` and `.sv` files in **PULPissimo**

**Goal**
- Create a file (for example: `pulpissimo_files.list`) that contains **all** `.v` and `.sv` files inside the PULPissimo project directory.
- Each line should contain one file path (absolute or relative).
- No empty lines, no duplicates.

**Expected Output**
- `pulpissimo_files.list`

---

## 2) Write a script to compare two list files

**Goal**
- Compare two list files: `list_1` and `list_2`.
- The script must output:
  - Files **missing** in `list_2` (present in `list_1` but not in `list_2`)
  - Files **extra** in `list_2` (present in `list_2` but not in `list_1`)
  - The **number of missing and extra** files

**Example**
list_1: aaa.v bbb.v ccc.v
list_2: aaa.v bbb.v
⇒ Result: list_2 is missing 1 file: ccc.v

**Input**
- `list_1`, `list_2`

**Output**
- `missing_in_list2.txt`
- `extra_in_list2.txt`
- Summary (printed on screen or written to `compare_summary.txt`)

---

## 3) `change_path` — Replace paths inside a file

**Goal**
- Create a script `change_path` (any scripting language) that takes **three arguments**:
  1. The target file name (e.g., `file_A`)
  2. The **source path** to be replaced (e.g., `home/spi/rtl_src`)
  3. The **target path** to replace with (e.g., `home/spi/rtl_src_new`)
- Replace **all** occurrences of the source path in the file with the target path.
- Preserve all other content in the file.

**Example**
./change_path.csh file_A home/spi/rtl_src home/spi/rtl_src_new
> This replaces every `home/spi/rtl_src` in `file_A` with `home/spi/rtl_src_new`.

**Input**
- `file_A`, `source_path`, `target_path`

**Output**
- Updated `file_A` (optionally keep a backup `.bak`)

---

## 4) Regression runner script

**Goal**
- Automatically run multiple testcases listed in `testlist` and generate:
  - Individual log files: `TC1.log`, `TC2.log`, ...
  - A summary report: `testlist.rpt`

**Requirements**
- `testlist` contains testcase names, one per line (e.g., `TC1`, `TC2`, ...).
- The script runs each testcase sequentially.
- Each testcase’s result is written into its own log file.
- The report `testlist.rpt` summarizes the results as **PASS**, **FAIL**, or **NA**:
  - **PASS / FAIL / NA** is determined from each testcase’s log file.
  - **NA** means the testcase could not compile or could not run simulation.

**Example**
testlist: TC1 TC2 TC3 TC4 TC5

Generated output:
TC1.log TC2.log TC3.log TC4.log TC5.log testlist.rpt

Content of testlist.rpt:
TC1: PASS
TC2: FAIL
TC3: PASS
TC4: NA
TC5: PASS
Report directory : <path to directory containing TC*.log>

**Input**
- `testlist` (path to the testcase list file)

**Output**
- Report directory (e.g., `reports/`) containing `TC*.log` and `testlist.rpt`

---

## Suggested Directory Structure


Linux_Vim_Scripting/
├─ B1/ # Task 1: Generate .v/.sv list (PULPissimo)
│ └─ pulpissimo_files.list
├─ B2/ # Task 2: Compare two lists
│ ├─ list_1
│ ├─ list_2
│ └─ Outputs: missing_in_list2.txt, extra_in_list2.txt, compare_summary.txt
├─ B3/ # Task 3: change_path
│ └─ change_path.* # your implementation (.csh/.sh/.py/…)
├─ B4/ # Task 4: regression runner
│ ├─ testlist
│ └─ reports/ # contains TC*.log and testlist.rpt
└─ README.md


---

## Collaboration

Developed in collaboration and with support from **[@tedduy](https://github.com/tedduy)**.

---

## License

MIT License (or update according to your policy).


