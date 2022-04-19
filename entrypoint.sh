#!/bin/bash

vncserver

if [ "$#" -eq 0 ]; then
  DISPLAY=:1 /root/ApacheDirectoryStudio/ApacheDirectoryStudio
fi

exec "$@"
