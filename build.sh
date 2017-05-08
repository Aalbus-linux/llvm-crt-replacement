#!/bin/bash

DEST="/usr/lib"
_ARCH=$(uname -m)

clang -fPIC -c crtbegin.c -o "$DEST"/crtbegin.o
cp "$DEST"/crtbegin.o "$DEST"/crtbeginS.o
cp "$DEST"/crtbegin.o "$DEST"/crtbeginT.o

clang -fPIC -c crtend.c -o "$DEST"/crtend.o
cp "$DEST"/crtend.o "$DEST"/crtendS.o
cp "$DEST"/crtend.o "$DEST"/crtendT.o

clang -c crti.c -o "$DEST"/crti.o
clang -c crtn.c -o "$DEST"/crtn.o

#crt_arch.h is architecture-dependent

cp ${_ARCH}/crt_arch.h .

clang -fPIC -c crt1.c -o "$DEST"/crt1.o

rm crt_arch.h


