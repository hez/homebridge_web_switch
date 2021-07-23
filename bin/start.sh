#!/bin/sh

cd /home/pi/homebridge_web_switch
_build/prod/rel/homebridge_web_switch/bin/homebridge_web_switch start >> logs/stdout.log 2>&1
