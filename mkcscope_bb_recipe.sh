#!/bin/sh
rm -rf cscope.out cscope.files

find . \( -name '*.bb' -o -name '*.bbappend' -o -name '*.bbclass' -o -name '*.conf' -o -name '*.inc' -o -name '*.service' -o -name '*.py' -o -name '*.sh' -o -name '*.ini' -o -name '*.patch' \) -print > cscope.files

cscope -R -b -i cscope.files
