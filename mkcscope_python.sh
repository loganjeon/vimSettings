# !/bin/sh
rm -rf cscope.files cscope.out

find $PWD \( -name '*.py' -o -name '*.txt' -o -name '*.yaml' -o -name '*.Dockerfile' -o -name 'Dockerfile' -o -name '*.sh' -o -name '*.json' \) -print > cscope.files

cscope -R -i cscope.files
