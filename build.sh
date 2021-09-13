#!/bin/sh
if [ $# -eq 0 ]; then
    echo "No PythonOCC version provided - selected last available version."
    version="7.5.1"
    sed -i "s/VERSION/$version/g" environment.yml
    docker build -t vo3xel/python-occ:latest .
    sed -i "s/$version/VERSION/g" environment.yml
else
    version=$1
    echo "Selected PythonOCC version: $version"
    sed -i "s/VERSION/$version/g" environment.yml
    docker build -t vo3xel/python-occ:$version .
    sed -i "s/$version/VERSION/g" environment.yml
fi

