#!/bin/sh
rm -rf cscope.out cscope.files cscope_extlib.files cscope_extlib.out

find . \( -name '*.[chsS]' -o -name '*.c[px][px]' -o -name '*.h[px][px]' -o -name '*.cc' -o -name '*.hh' -o -name '*.asm' -o -name '*.[Mm]ake' -o -name '*.js' -o -name '*.html' -o -name '*.php' -o -name '*.xml' -o -name '*.go' -o -name '*.json' -o -name '*.cfg' -o -name '*.mk' -o -name '[Mm]akefile' -o -name '*.ini' -o -name '*.inc' -o -name '*.cmake' -o -name 'CMakeLists.txt' -o -name '*.a[mc]' -o -name '*.in' -o -name '*.conf' -o -name '*.sh' \) -print > cscope.files

find $EXT_LIB_HOME \( -name '*.[chsS]' -o -name '*.c[px][px]' -o -name '*.h[px][px]' -o -name '*.cc' -o -name '*.hh' -o -name '*.asm' -o -name '*.[Mm]ake' -o -name '*.js' -o -name '*.html' -o -name '*.php' -o -name '*.xml' -o -name '*.go' -o -name '*.json' -o -name '*.cfg' -o -name '*.mk' -o -name '[Mm]akefile' -o -name '*.ini' -o -name '*.inc' -o -name '*.cmake' -o -name 'CMakeLists.txt' -o -name '*.a[mc]' -o -name '*.in' -o -name '*.conf' -o -name '*.sh' \) -print > cscope_extlib.files

cscope -R -i cscope.files
cscope -R -i cscope_extlib.files -f cscope_extlib.out
