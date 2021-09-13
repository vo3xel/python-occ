#!/bin/sh
if [ $# -eq 0 ]; then
    version="7.5.1"
    echo "No PythonOCC version provided - selected last available version ($version)."
    docker build -t vo3xel/python-occ:latest .
else
    version=$1
    echo "Selected PythonOCC version: $version"
    docker build --build-arg OCC_VERSION="$version"  -t vo3xel/python-occ:"$version" .
fi

docker run vo3xel/python-occ:"$version" test.py