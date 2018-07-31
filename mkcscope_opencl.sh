#!/bin/sh
rm -rf cscope.out cscope.files

find . \( -name '*.[chsS]' -o -name '*.c[px][px]' -o -name '*.h[px][px]' -o -name '*.cc' -o -name '*.hh' -o -name '*.asm' -o -name '*.[Mm]ake' -o -name '*.xml' -o -name '*.cfg' -o -name '*.mk' -o -name '[Mm]akefile' -o -name '*.ini' -o -name '*.inc' -o -name '*.cmake' -o -name 'CMakeLists.txt' -o -name '*.a[mc]' -o -name '*.in' -o -name '*.conf' -o -name '*.sh' -o -name '*.S' -o -name '*.cl' \) -print > cscope.files

cscope -I cscope.files
