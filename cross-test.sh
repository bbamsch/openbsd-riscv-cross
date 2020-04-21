#!/bin/ksh

. ./env.sh
. ./cross-env.sh

${CC} --target=riscv64-unknown-openbsd6.7 \
	-march=rv64gc -mcmodel=medany \
	-fno-stack-protector \
	-nostdlib -nostdinc -idirafter ${destdir}/usr/include \
	-mno-relax -O0 -g \
	-Wl,-z,notext \
	test.c -o test
