scripte utf-8
" vim: set fenc=utf-8 tw=0:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" Vim Configuration """""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Configuration 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocp

" Restore all options to default
set all&

" History count
set hi=100

" for using backspace
set bs=indent,eol,start

" Character encoding configuration
set fencs=utf-8,cp949,cp932,euc-kr,shift-jis,big5,ucs-2le,latin1
set enc=utf-8

" Funcion if existing home directory
if exists("$HOME")

	let s:home_dir = $HOME
	let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)
	if s:temp == "/" || s:temp == "\\"
		let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)
	endif

" Path configuration
if has("win32")
	let s:dir_tmp = s:home_dir."/_vim/tmp"
	let s:dir_backup = s:home_dir."/_vim/backup"
else
	let s:dir_tmp = s:home_dir."/.vim/tmp"
	let s:dir_backup = s:home_dir."/.vim/backup"
endif

" Temp directory configuration
	if isdirectory(s:dir_tmp)
		set swf
		let &dir = s:dir_tmp
	else
		set noswf
		set dir=.
	endif

" Backup directory configuration
	if isdirectory(s:dir_backup)
		set bk
		let &bdir = s:dir_backup
		set bex=.bak
	else
		set nobk
	endif

endif

" Not redraw while executing macros, and commands.
set lazyredraw
" Load plugins when starting up
set loadplugins


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing feature configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always display see cursor location
set ru

" Display command which completing
set sc

" Display line number
set nu

" Configure width of line number
set nuw=5

" Configure tab
set ts=4
set sw=4
set et
set showmode
set ai
set cindent
set ignorecase
set autoread

set csto=0
set cst
set nocsverb


" Convert tab to space feature (off)
set noet
set sts=0

" Auto line feed (off)
set nowrapscan

" Restore location of last editing
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

" Mapping clip-board to unnamed register for using gVim and xterm
if has("gui_running") || has("xterm_clipboard")
	set cb=unnamed
endif

" Use magic feature
set magic

" Automatic moving to starting in line for some moving operation 
set sol

" Configure for visual mode
set sel=exclusive

" Permit to making selected region using shift key
"set km=startsel,stopsel

" Off the feature which paste using middle mouse button
map <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>

" add '<', '>' in find feature 
set mps+=<:>

"set sm

" Using insert key for paste mode
"set pt=<Ins>

" No timeout for waiting key input
set noto ttimeout

" Configure waiting time for key input
set tm=3000 ttm=100

" Using tab key fnd shift+tab key for indent
vmap <Tab> >gv
vmap <S-Tab> <gv

" Waiting time for making swap file
set ut=5000

" Minimum character for making swap file
set uc=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight all matches
set hlsearch

" Not search wrap around the end of a file
set nowrapscan

" Ignore case in search patterns
set ignorecase

" Override ignorecase option if the search pattern contains an uppercase
" character.
set smartcase

" Show where the pattern matches as it was typed so far.
set incsearch

" Jump to one to the other using %. Various character can be added.
set matchpairs+=<:>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 모양 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Configure font for GUI mode
if has("gui_running")
	set lines=50
	set co=125
endif

" Tracking level to maximum
set report=0

" Always display status line
set ls=2

" Configure font
if has("gui_running")
	if has("win32")
		set gfn=굴림체:h9:cHANGEUL
"		set gfn=GulimChe:h9:cHANGEUL
	elseif has("unix")
		set gfn=monospace\ 10
	endif
"	set gfn=Jung9\ 9
"	set gfn=Fixedsys:h12:cHANGEUL
	set guifont=Menlo\ Regular:h12
endif

" Configure line spacing
set lsp=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype feature & Syntax Highlighting feature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto recognition kind of file
filet plugin indent on

" Configure file type for custom file extension
"au BufRead,BufNewFile *.dic setl ft=php

" Enableing syntas highlighting feature through file type
"sy enable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No use auto indent
set noai

" No use smart indent
set nosi

" Use C indent
au FileType javascript,jsp setl cin


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme (:colo desert)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Boilerplate configuration
iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
iab xtime <C-R>=strftime("%H:%M:%S")<CR>

" for real regular expression not only vim regex
"map / /\v

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc

func! SplitTj()
	let st = expand("<cword>")
	exe "stj ".st
endfunc

func! VertSplitTj()
	let st = expand("<cword>")
	exe "vert stj ".st
endfunc

func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:1:p:o ".sm
endfunc

map <F1> :call Man()<cr>
"map <F2> :w!<cr>
map <F2> :!cscope -qb<cr> :cscope reset<cr>
" Make ctags for c++
map <F3> :!ctags -R --verbose=yes --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F4> :TagbarToggle<cr>
map <F5> :NERDTreeToggle<cr>
map <F6> :TrinityToggleSourceExplorer<cr> :set statusline=%F<cr>
"map <F6> :TrinityToggleAll<cr>
"map <F6> :TrinityToggleAll<cr> :set statusline=%F<cr>
"map <F6> :call Tj()<cr>
map <F7> :call SplitTj()<cr>
map <F8> :call VertSplitTj()<cr>
map <F9> :call Tj()<cr>
"map <F9> v]}zf
map <F10> :BufExplorer<cr>
map <C-n> :tabnew<cr>
map <C-h> gT
map <C-l> gt
"nmap <C-]> :call Tj()<cr> 
"map <F7> zo
"map <F8> [i
"map <F9> gd
"map <F11> ZZ
map <F11> :FSHere<cr>
map <F12> :FSSplitAbove<cr>
"map <F12> <c-T>
" Make ctags for c++

map ,1 :b!1<cr>
map ,2 :b!2<cr>
map ,3 :b!3<cr>
map ,4 :b!4<cr>
map ,5 :b!5<cr>
map ,6 :b!6<cr>
map ,7 :b!7<cr>
map ,8 :b!8<cr>
map ,9 :b!9<cr>
map ,0 :b!10<cr>
map ,w :bw<cr>

"if filereadable("./cscope.out")
"	cs add cscope.out
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Simplification
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("gui_running")
if 0

" Don't use gVim menu
	set go-=m

" Don't display toolbar
	set go-=T

" Don't display scrollbar
	set go-=l
	set go-=L
	set go-=r
	set go-=R
	set go-=b

" Don't use mouse 
	set mouse=nicr

" Set mouse model to popup
	set mousem=popup

" Don't popup 'simple choice' dialog
	set go+=c

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenient feature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto-complete using tab key
set wmnu

" File explore configuration파일 탐색기 설정
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

" vim -b : Edit binary file as xxd format (:help hex-editing)
"augroup Binary
"	au!
"	au BufReadPre  *.bin let &bin=1
"	au BufReadPost *.bin if &bin | %!xxd
"	au BufReadPost *.bin set ft=xxd | endif
"	au BufWritePre *.bin if &bin | %!xxd -r
"	au BufWritePre *.bin endif
"	au BufWritePost *.bin if &bin | %!xxd
"	au BufWritePost *.bin set nomod | endif
"augroup END

" Spell Checking feature 
" unable default
set nospell spelllang=en

" some toggle feature
fu! ToggleNu()
	let &nu = 1 - &nu
endf
fu! ToggleList()
	let &list = 1 - &list
endf
fu! TogglePaste()
	let &paste = 1 - &paste
endf
fu! ToggleSpell()
	let &l:spell = 1 - &l:spell
endf
"map \n :call ToggleNu()<CR>
"map \l :call ToggleList()<CR>
"map \p :call TogglePaste()<CR>
"map \s :call ToggleSpell()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" etc configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't redraw while excuting macro
set lz

" Load plugins when start program
set lpl

" set ff=unix
" unix dos mac 줄 변경자 모두 다 읽을 수 있도록 합니다.
set ffs=unix,dos,mac

"use absolute path for cscope
"set nocsre

"don't use auto change Directory
set noautochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for silver searcher ag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
""" if you want to use clang with llvm """
"let g:syntastic_cpp_checkers = ['clang-check', 'clang-tidy', 'gcc']
let g:syntastic_cpp_checkers = ['clang-check']
let g:syntastic_cpp_compiler = 'clang++'
let g:systastic_cpp_compiler_options = '-std=c++14 -stdlib=libc++'
""" else if you want use GNU C++ """
"let g:syntastic_cpp_checkers = ['g++']
"let g:syntastic_cpp_compiler = 'g++'
"let g:systastic_cpp_compiler_options = '-std=c++14' 

""" default Syntastic mode """ 
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Vim-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_frontmatter = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Delimitmate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_matchpairs = "(:),[:],{:}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Clang complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('macunix')
" for MacOS path
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
else
" for Linux path
"let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so'
"let g:clang_library_path='/usr/lib64/llvm/libclang.so'
let g:clang_library_path='/usr/lib/llvm-6.0/lib/libclang.so'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Clang format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" " if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" " Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Snippet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Autoproto
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=~/.vim/tags/systags
set tags+=~/.vim/tags/cpptags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for C Vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
let g:C_UseTool_cmake    = 'yes'
let g:C_UseTool_doxygen = 'yes'
let g:C_CFlags	= '-Wall -g -O0 -c -std=c++14'
let g:C_LFlags	= '-Wall -g -O0 -std=c++14'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Color Scheme Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:molokai_original = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for gutentags_plus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
"
" " config project root markers.
let g:gutentags_project_root = ['.root']
"
" " generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
"
" " forbid gutentags adding gtags databases
"let g:gutentags_auto_add_gtags_cscope = 0

" disable the default keymaps
let g:gutentags_plus_nomap = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_sort = 0

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos='right'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline_theme='dark'
"let g:airline_solarized_bg='dark'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
set laststatus=2
"let g:airline_symbols.branch = ''
"let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_section_error  = ''
let g:airline_section_warning = ''
let g:airline_symbols.notexists = ''

"set background=light
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for vim-mark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch to a richer palette of up to 18 colors
let g:mwDefaultHighlightingPalette = 'extended'
" switch to a richer palette of up to 27, 58 or even 77, 
" depending on the number of available colors
let g:mwDefaultHighlightingPalette = 'maximum'

" restrict color number via
"let g:mwDefaultHighlightingNum = 100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for DirDiff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DirDiffExcludes = "CVS,*.class,*.o,,cscope.files,cscope.out,tags,.git"
"let g:DirDiffIgnore = "Id:,Revision:,Date:"
"let g:DirDiffWindowSize = 14
" ignore white space in diff
"let g:DirDiffAddArgs = "-w"
"let g:DirDiffEnableMappings = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L10
"Plugin 'user/L9', {'name': 'newL9'}
" Installed Plugins
"Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'eikenb/acp'
Plugin 'wesleyche/srcexpl'
Plugin 'taglist.vim'
Plugin 'wesleyche/trinity'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'petrushka/vim-opencl'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'raimondi/delimitmate'
Plugin 'rip-rip/clang_complete'
Plugin 'c.vim'
Plugin 'autoproto.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'tomasr/molokai'
Plugin 'rhysd/vim-clang-format'
Plugin 'isagalaev/highlight.js'
Plugin 'feross/standard'
Plugin 'hushicai/tagbar-javascript.vim'
"Plugin 'jshint/jshint'
Plugin 'beautify-web/js-beautify'
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'skywind3000/gutentags_plus'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-mark'
Plugin 'flazz/vim-colorschemes'
Plugin 'will133/vim-dirdiff'
Plugin 'fatih/vim-go'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'AnsiEsc.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'vhdirk/vim-cmake'
Plugin 'pboettch/vim-cmake-syntax'
"Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Custom Command
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:command! OpenInVSCode exe "silent !code --goto '%:" . line(".") . ":" . col(".") . "'" | redraw!
:command! OpenCwdInVSCode exe "silent !code '" . getcwd() . "' --goto '%:" . line(".") . ":" . col(".") . "'" | redraw!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for excution MarkSave with viminfo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo+=!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End of File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
