#!/bin/bash

which pip && exit 0

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py
