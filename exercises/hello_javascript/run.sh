#!/bin/bash

# The uploaded user files are always in /submission/user
# and named identically to config.yaml regardless of the uploaded file names.

# The mount directory from config.yaml is in /exercise.
# Append the required support files to test user solution.

# "capture" etc description in https://github.com/apluslms/grading-base

git clone "$(cat /submission/user/gitsource)" /submission/user-repo
cd /submission/user-repo/
PORT=8082
npm i
./node_modules/parcel-bundler/bin/cli.js index.html --port $PORT &
server_pid=$!

cd /wdio
node_modules/.bin/wdio 
capture node wdio-render.js wdio-0-0-json-reporter.log

kill $server_pid

err-to-out
grade