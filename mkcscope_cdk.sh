# !/bin/sh
rm -rf cscope.files cscope.out

find $PWD \( -name '*.ts' -o -name '*.py' -o -name '*.txt' -o -name '*.yaml' -o -name '*.list' -o -name '*.Dockerfile' -o -name 'Dockerfile' -o -name '*.sh' -o -name '*.json' \) -print > cscope.files

cscope -R -i cscope.files
