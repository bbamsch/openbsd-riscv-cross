#/bin/ksh

. ./env.sh

# Directories to skip
skipdir=""
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
