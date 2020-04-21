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
COMMON_MAKE_PARAMS="TARGET=${target} CROSSDIR=${destdir} DESTDIR=${destdir}"
unset skipdir

export CFLAGS="$CFLAGS -mno-relax"
export CXXFLAGS="$CXXFLAGS -mno-relax"
export AFLAGS="$AFLAGS -mno-relax"
cd ${srcdir}/$1
make -j`sysctl -n hw.ncpu` $2 ${COMMON_MAKE_PARAMS} 
