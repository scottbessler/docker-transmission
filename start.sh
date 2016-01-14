#!/bin/sh

handle_signal() {
  PID=$!
  echo "received signal. PID is ${PID}"
  kill -s SIGHUP $PID
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

echo "starting transmission"
transmission-daemon -f -g /config -T -w /data & wait
echo "stopping transmission"
