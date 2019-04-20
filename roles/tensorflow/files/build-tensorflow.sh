#!/bin/bash

[ $# -lt 1 ] && {
	echo "usage: $0 <tensorflow path>"
	exit 1
}

[ -f /tmp/tensorflow_pkg/tensorflow-*.whl ] && exit 0

tensorflow_path=$1

cd ${tensorflow_path}/tensorflow

bazel build -c opt --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --host_copt="-std=gnu99" --copt="-std=gnu99" --verbose_failures tensorflow/tools/pip_package:build_pip_package

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
