#!/bin/bash


# Drop when switching to the new `compiler` syntax.
export LDFLAGS="${LDFLAGS} -Wl,-rpath,$PREFIX/lib"

sed -i.orig s:'@PREFIX@':"${PREFIX}":g src/fccfg.c

chmod +x configure

./configure --prefix "${PREFIX}" \
	    --enable-libxml2 \
	    --enable-static \
	    --disable-docs \
      --with-add-fonts=${PREFIX}/fonts

make -j${CPU_COUNT}
make check
make install

# Remove computed cache with local fonts
rm -Rf "${PREFIX}/var/cache/fontconfig"

# Leave cache directory, in case it's needed
mkdir -p "${PREFIX}/var/cache/fontconfig"
touch "${PREFIX}/var/cache/fontconfig/.leave"
