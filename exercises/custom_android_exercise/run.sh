#!/bin/bash

cp /submission/user/application.apk /wdio/
cp -R /exercise/wdio/. /wdio/

# enable hardware keyboard
sed -i 's/hw.keyboard=no/hw.keyboard=yes/'  /root/.android/avd/test.avd/config.ini

# Start emulator
xvfb-run /opt/android-sdk/emulator/emulator -avd test -netdelay none -netspeed full > /dev/null 2>&1 &

# Don't exit until emulator is loaded

# press back button in case there is a system error alert on startup (happens sometimes)
/opt/android-sdk/platform-tools/adb shell input keyevent 4

# disable on-screen keyboard
/opt/android-sdk/platform-tools/adb shell settings put secure show_ime_with_hard_keyboard 0

cd /wdio
# Run tests
./node_modules/.bin/wdio 
capture node wdio-render.js wdio-0-0-json-reporter.log

err-to-out
grade
