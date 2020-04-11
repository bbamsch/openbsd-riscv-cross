#/bin/ksh

. ./env.sh

# Skip directories with build errors
# XXX TODO: Fix build errors in these directories
skipdir="libexec/ld.so"
COMMON_MAKE_PARAMS="TARGET=${target} CROSSDIR=${destdir} DESTDIR=${destdir} SKIPDIR=\"${skipdir}\""
unset skipdir

commands="$@"
if [[ ! -n "$commands" ]]; then
	# default commands
	commands="cross-dirs cross-includes"
fi

cd ${srcdir}
for command in ${commands[@]}; do
	make -f Makefile.cross "${command}" ${COMMON_MAKE_PARAMS}
done
