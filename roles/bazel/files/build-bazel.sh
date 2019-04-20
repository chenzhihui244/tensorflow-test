#!/bin/bash

if [ $# -lt 2 ]; then
	echo "usage: $0 <bazel path> <bazel package>"
	exit 1
fi

[ -x /usr/local/bin/bazel ] && {
	echo "bazel already installed"
	exit 0
}

bazel_path=$1
bazel_src_pkg=$2
bazel_src_dir=${bazel_src_pkg%\.*}
bazel_src_dir=${bazel_src_dir%-*}

cd $bazel_path

[ -d ${bazel_path}/${bazel_src_dir} ] || unzip $bazel_src_pkg -d $bazel_src_dir

cd $bazel_src_dir && ./compile.sh && cp output/bazel /usr/local/bin/
