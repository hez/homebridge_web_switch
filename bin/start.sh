#!/bin/sh

cd /home/pi/homebridge_web_switch
MIX_ENV=prod mix phx.server >> logs/stdout.log 2>&1
