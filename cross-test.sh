#!/bin/ksh

. ./env.sh
. ./cross-env.sh

${CC} --target=riscv64-unknown-openbsd6.6 \
	-march=rv64gc -mcmodel=medany \
	-nostdinc -idirafter ${distdir}/usr/include \
	-mno-relax \
	-c test.c -o test
