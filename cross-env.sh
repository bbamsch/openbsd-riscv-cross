#/bin/ksh

. ./env.sh

#set -x
eval export $(
	cd ${srcdir} && \
	make -f Makefile.cross cross-env TARGET=${target} CROSSDIR=${destdir} DESTDIR=${destdir}
)

export	LD=/usr/local/riscv/bin/ld.lld \
	CPP=/usr/local/riscv/bin/clang-cpp \
	STRIP=/usr/local/riscv/bin/llvm-strip \
	CXX=/usr/local/riscv/bin/clang++ \
	AS=/usr/local/riscv/bin/llvm-as \
	AR=/usr/local/riscv/bin/llvm-ar \
	RANLIB=/usr/local/riscv/bin/llvm-ranlib \
	CC=/usr/local/riscv/bin/clang \
	OBJCOPY=/usr/local/riscv/bin/llvm-objcopy

# XXX For some reason MACHINE_ARCH seems to break Makefiles ???
unset MACHINE_ARCH

# Force RISC-V Compile via CFLAGS
export CFLAGS="$CFLAGS --target=riscv64-unknown-openbsd6.6 -march=rv64gc"

