#!/bin/sh
if [ $# -eq 0 ]; then
    echo "No PythonOCC version provided"
    exit 1
fi
sed -i "s/VERSION/$1/g" environment.yml
docker build -t vo3xel/python-occ:$1 .
sed -i "s/$1/VERSION/g" environment.yml