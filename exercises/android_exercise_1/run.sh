#!/bin/bash

export JAVA_HOME=/usr/local/java/jdk1.8.0_131/
apt-get install -y runit
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
mkdir /wdio
cd /wdio


#Webdriver.io
npm init -y 
npm install --silent -y --save-dev \
	@wdio/cli \
	chai \
	chai-webdriverio \
	@wdio/appium-service \
	@wdio/local-runner \
	@wdio/mocha-framework \
   	wdio-json-reporter \
    nunjucks \
    appium

cp /submission/user/application.apk /wdio/
cp -R /exercise/wdio/. /wdio/

# enable hardware keyboard
sed -i 's/hw.keyboard=no/hw.keyboard=yes/'  /root/.android/avd/nexus.avd/config.ini

# Start emulator
xvfb-run emulator64-x86 -avd nexus -netdelay none -netspeed full > /dev/null 2>&1 &

# Don't exit until emulator is loaded
output=''
while [[ ${output:0:7} != 'stopped' ]]; do
  output=`adb shell getprop init.svc.bootanim`
  sleep 1
done

# press back button in case there is a system error alert on startup (happens sometimes)
adb shell input keyevent 4

# disable on-screen keyboard
adb shell settings put secure show_ime_with_hard_keyboard 0

# Run tests
./node_modules/.bin/wdio 
capture node wdio-render.js wdio-0-0-json-reporter.log

err-to-out
grade
