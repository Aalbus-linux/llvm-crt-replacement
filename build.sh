#!/bin/sh

#DEST="/usr/lib"
#TARGET=$(uname -m)

clang $CFLAGS -fPIC -c crtbegin.c -o "$DEST"/crtbegin.o
cp "$DEST"/crtbegin.o "$DEST"/crtbeginS.o
cp "$DEST"/crtbegin.o "$DEST"/crtbeginT.o

clang $CFLAGS -fPIC -c crtend.c -o "$DEST"/crtend.o
cp "$DEST"/crtend.o "$DEST"/crtendS.o
cp "$DEST"/crtend.o "$DEST"/crtendT.o

clang -c crti.c -o "$DEST"/crti.o
clang -c crtn.c -o "$DEST"/crtn.o

#crt_arch.h is architecture-dependent

cp ${TARGET}/crt_arch.h .

clang $CFLAGS -fPIC -c crt1.c -o "$DEST"/crt1.o

rm crt_arch.h


