# vimSettings
Settings for using vim as a IDE

1. Download to home folder.
2. Set up Vundle.
   ref : https://github.com/VundleVim/Vundle.vim
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. Install plugins using vundle
   Launch vim and run :PluginInstall
   
   
* make systags and cpptags for autoproto.vim plugin.
 ○ $ ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/cpptags /usr/include/c++
 ○ $ ctags -R -f ~/.vim/systags --c-kinds=+p /usr/include /usr/local/include
