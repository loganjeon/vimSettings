# vimSettings
Settings for using vim as a IDE

1. Download to home folder
2. Set up Vundle
   - ref : https://github.com/VundleVim/Vundle.vim
   - $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. Install plugins using vundle
   - Launch vim and run :PluginInstall
   
4. make systags and cpptags for autoproto.vim plugin
   - $ ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/cpptags /usr/include/c++
   - $ ctags -R -f ~/.vim/systags --c-kinds=+p /usr/include /usr/local/include

If you wanna use oh-my-zsh, install zsh and oh-my-zsh before.
1. Install zsh
   - (on ubuntu) $ sudo apt install zsh
   - (on mac) $ brew install zsh
2. Set default shell
   - $ chsh -s /usr/bin/zsh
   - $ echo $(SHELL)
3. Install oh-my-zsh
   - (on ubuntu) $ sudo apt install git wget curl
   - (on mac) $ brew install git wget curl
   - $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   Reference : https://github.com/robbyrussell/oh-my-zsh
   
and Check other tools out which have configuring this repo, like screen, tmux, tig, cscope, universal-ctags, ag an so on before setting up this configure
1. Install other tools
   - (on ubuntu) $ sudo apt install cscope ctags screen tmux tig silversearcher-ag pkg-config llvm vim
   - (on mac) $ brew install cscope ctags screen tmux tig the_silver_searcher pkg-config llvm macvim
   if use universal-ctags
   - (on mac) $ brew install --HEAD universal-ctags/universal-ctags/universal-ctags
2. for Integration with vscode, try installing and using vscode(visual studio code)
   - https://code.visualstudio.com/
   - Install plugin "Open in Vim" and setting up.
