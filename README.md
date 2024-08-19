# Vim Settings
## Settings for using vim as a IDE

### 1. Download or Git clone to local
<br>

### 2. Run install.sh
It performs the follwing actions:
- Install zsh and oh-my-zsh(https://github.com/robbyrussell/oh-my-zsh)
- Install font for using powerline
- Install some CLI tools
	- git, wget, curl, cscope, ctags, screen, tmux, tig, silversearcher-ag, pkg-config, llvm, cmake, vim
- Copy some files for configuration of CLI tools
	- .vim, .vimrc, .tmux.conf, .screenrc, .tigrc, .gitignore_global
- Copy scripts for cscope and ctags
```
cd vimSettings
sh ./install.sh
```
<br>

### 3. Set up Vundle
For management Vim plugins
refer to https://github.com/VundleVim/Vundle.vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
<br>

### 4. Install plugins using vundle
Launch vim and run ":PluginInstall" in command mode
<br>

### 5. make systags and cpptags for autoproto.vim plugin
   - $ ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/cpptags /usr/local/include/c++/[version]
   - $ ctags -R -f ~/.vim/systags --c-kinds=+p /usr/include /usr/local/include
<br>

***
### If you want to use universal-ctags on Mac OS
```
brew remove ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```
### For Integration with vscode, try installing and using vscode(visual studio code)
- Refer to https://code.visualstudio.com/
- Install plugin "Open in Vim" and setting up.

