# !/bin/sh
rm -rf cscope.files cscope.out

find $PWD \( -name '*.py' -o -name '*.cs' -o -name '*.meta' -o -name '*.cs.meta' -o -name '*.asset' -o -name '*.js' -o -name '*.unityweb' -o -name '*.html' -o -name '*.plist' -o -name '*.ini' -o -name '*.config' -o -name '*.map' -o -name '*.browser' -o -name '*.xml' -o -name '*.txt' -o -name '*.yaml' -o -name '*.Dockerfile' -o -name 'Dockerfile' -o -name '*.sh' -o -name '*.json' \) -print > cscope.files

cscope -R -i cscope.files
