#!/bin/bash

# Testcase is a single graded test case. In short, it runs given command and
# if that command fails, then no points are given. If the command succeeds, then
# points are given.
# Testcase writes all information to files under /feedback/<number>/, where
# <number> is the first free number starting from 0.

cp /exercise/Makefile /submission/user/Makefile
cp /exercise/cars.txt /submission/user/cars.txt
cd /submission/user/
make assignment.out

testcase -t "Test" -p 1 \
    stdio-diff -S /exercise/given1.in /exercise/expected1.out \
    ./assignment.out cars.txt
# The command stdio-diff takes the input and the expected output file.
# Then, it runs student code `sh solution.sh` and compares it's output to
# the expected one. If they differ, it will print the difference and exit
# with 1 (thus failing the test).
# Because flag `-S`, diff will ignore space when comparing lines.

# In this final test case, we use `-f` to set fail message for stdio-diff and
# that hides the diff output.
# You should return 0, if ecerything goes well. If you don't, you will get a line in the grading-script-errors log.
# You can use commands  `exit 0`, `true` or `:` for example.
:
