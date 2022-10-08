#!/bin/bash

wget --no-check-certificate -r --accept-regex='2.*' --reject-regex 'update' -A 'ApacheDirectoryStudio*linux*.tar.gz' https://dlcdn.apache.org/directory/studio/
tar -xf $(find ./dlcdn.apache.org -name '*linux*tar.gz') -C /root/
EXIT=$?
rm -rf /root/dlcdn.apache.org

#exit $EXIT
