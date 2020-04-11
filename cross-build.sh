#/bin/ksh

# Make sure target package was specified
if [[ "$#" -lt "1" ]]; then
	echo "Usage: $0 path/to/target"
	exit
fi

. ./cross-env.sh

# Make sure that the target package exists
if [[ ! -d "${srcdir}/$1" ]]; then
	echo "Target directory <${srcdir}/$1> does not exist"
	exit
fi

# Skip directories with build errors
# XXX TODO: Fix build errors in these directories
skipdir="libexec/ld.so"
COMMON_MAKE_PARAMS="TARGET=${target} CROSSDIR=${destdir} DESTDIR=${destdir} SKIPDIR=\"${skipdir}\""
unset skipdir

cd ${srcdir}/$1
make ${COMMON_MAKE_PARAMS} 
