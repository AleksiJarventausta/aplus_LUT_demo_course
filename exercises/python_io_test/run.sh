#!/bin/bash

# The uploaded user files are always in /submission/user
# and named identically to config.yaml regardless of the uploaded file names.
# The directory /submission/user is also the default working directory
# in the container.

# The mount directory from config.yaml is in /exercise.
# Append the required support files to test user solution.

# Add the working directory to the PYTHONPATH so that the grader
# can import the student's submission. The grader program is started
# under the path /exercise since there is no need to copy it to
# the working directory.

testcase -t "Akumiitti" -p 1 \
    stdio-diff -S /exercise/given1.in /exercise/expected1.out \
    python3 /submission/user/assignment.py

testcase -t "Saippuakauppias" -p 1 \
    stdio-diff -S /exercise/given2.in /exercise/expected2.out \
    python3 /submission/user/assignment.py
# "capture" etc description in https://github.com/apluslms/grading-base

