#!/bin/bash -x

BUILDDIR=$(dirname $0)
BUILDDIR="$(readlink -f $BUILDDIR)/build"
URIDIR="$BUILDDIR/uriparser"

if [ -n "$URIDIR/lib/liburiparser.a" ]; then
    cd deps/ngx_url_parser && make static-lib
    cd -
    mkdir -p $URIDIR && cd deps/uriparser && ./autogen.sh && ./configure --with-pic --disable-test --disable-doc --disable-shared --prefix=$URIDIR && make clean install
fi
