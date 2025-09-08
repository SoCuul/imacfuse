#!/bin/sh

# symlink fuse-t here to avoid escaping spaces
# rm -rf fuse-t
# ln -s "/Library/Application Support/fuse-t" .

olddir=`pwd`
srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

(
  cd "$srcdir"

  aclocal
  autoheader
  automake --add-missing
  autoconf

  cd "$olddir"
)

if [ -z "$NOCONFIGURE" ]; then
  $srcdir/configure "$@"
fi
