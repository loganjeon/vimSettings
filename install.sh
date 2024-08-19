#!/bin/sh

### Install requisite utils and Setting zsh as a default shell ###
if [ "$(uname)" == "Darwin" ]; then
	echo "This is macOS"
	brew install git wget curl zsh
	brew install cscope universal-ctags screen tmux tig the_silver_searcher pkg-config llvm cmake vim macvim
	chsh -s /usr/zsh
elif [ -f /etc/lsb-release ]; then
	echo " This is Ubuntu"
	sudo apt install git wget curl zsh 
	sudo apt install cscope universal-ctags screen tmux tig silversearcher-ag pkg-config llvm vim
	chsh -s /usr/bin/zsH
else
	echo "This script only supports macOS and Ubuntu"
	exit 1
fi

### Install oh-my-zsh ###
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### Install powerline fonts ###
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
sh install.sh
cd ..
rm -rf fonts

### For setting zsh environment ###
sed -i.bak "s/robbyrussell/agnoster/g" "$HOME/.zshrc"
#mv -nu ~/.zshrc ~/.zshrc.bak
#cp .zshrc ~/

### For configurations of cli utils ###
cp .tmux.conf ~/
cp .screenrc ~/
cp .tigrc ~/

### For setting vim ###
mv -nu ~/.vimrc ~/.vimrc.bak
cp .vimrc ~/
mv -nu ~/.vim ~/.vim.bak
cp -rf .vim ~/

if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
	echo "!!! Vundle.vim exists !!! "
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

### For copying scripts of cscope and ctags
cp ./mkcscope*.sh ~/
cp ./mkctags*.sh ~/
cp ./mkgtags-cscope.sh ~/

### For global git ignorations ###
mv -nu ~/.gitignore_global ~/.gitignore_global.bak
cp .gitignore_global ~/

