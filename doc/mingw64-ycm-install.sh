#!/usr/bin/bash

# Refer to: https://www.snip2code.com/Snippet/1127715/build-ycm-on-MSYS2

# Requirements
#pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb mingw-w64-x86_64-make mingw-w64-x86_64-cmake mingw-w64-x86_64-clang

export PATH=/mingw64/bin:$PATH

cd ~/.vim/bundle/YouCompleteMe
mkdir -p build
cd build

# Specify python library path
#-DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.dll.a

cmake -G "MSYS Makefiles" -DCMAKE_MAKE_PROGRAM=/mingw64/bin/mingw32-make.exe -DUSE_SYSTEM_LIBCLANG=ON . ../third_party/ycmd/cpp

mingw32-make.exe
