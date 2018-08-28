#!/bin/sh
rm -rf cscope.out cscope.files

find . \( -name '*.[chsS]' -o -name '*.c[px][px]' -o -name '*.h[px][px]' -o -name '*.cc' -o -name '*.hh' -o -name '*.asm' -o -name '*.[Mm]ake' -o -name '*.js' -o -name '*.html' -o -name '*.php' -o -name '*.xml' -o -name '*.go' -o -name '*.json' -o -name '*.cfg' -o -name '*.mk' -o -name '[Mm]akefile' -o -name '*.ini' -o -name '*.inc' -o -name '*.cmake' -o -name 'CMakeLists.txt' -o -name '*.a[mc]' -o -name '*.in' -o -name '*.conf' -o -name '*.sh' \) -print > cscope.files

cscope -R -b -i cscope.files
