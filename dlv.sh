#!/bin/sh
echo "running dlv"
cd /src/work
dlv debug --headless --log -l :2345 --api-version=2
echo "dlv exited"