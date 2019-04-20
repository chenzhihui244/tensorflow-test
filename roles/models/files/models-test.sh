#!/bin/bash

[ $# -lt 1 ] && {
	echo "usage: $0 <models path>"
	exit 1
}

models_path=$1

cd ${models_path}/models/tutorials/image/mnist && \
	python convolutional.py
