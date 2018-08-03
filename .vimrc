scripte utf-8
" vim: set fenc=utf-8 tw=0:
" 파일의 첫부분에 위의 2줄을 꼭 남겨 두십시오.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 인클루드의 Vim 설정 파일
" 마지막 수정: 2006-01-17 04:29:44 KST
" $Id: .vimrc 112 2006-01-16 19:30:18Z barosl $
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 프로그램 기본 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 오리지널 Vi 와의 호환성을 없애고, Vim 만의 기능들을 쓸 수 있게 함.
set nocp

" 모든 옵션을 원래대로 복원
set all&

" 명령어 기록을 남길 갯수 지정
set hi=100

" 백스페이스 사용
set bs=indent,eol,start

" 인코딩 설정
" 문서를 읽을 때 BOM 을 자동으로 제거하려면, fencs 맨 앞에 ucs-bom 를 추가하세요.
"let &tenc=&enc
"set enc=utf-8
set fencs=utf-8,cp949,cp932,euc-kr,shift-jis,big5,ucs-2le,latin1
set enc=utf-8

" 홈 디렉토리가 존재할 때에만 사용할 수 있는 기능들
if exists("$HOME")

" 홈 디렉토리를 구한다.
" 특정 시스템에서는 홈 디렉토리 경로 끝에 / 또는 \ 문자가
" 붙어 있기 때문에, 그것들을 제거한다.
	let s:home_dir = $HOME
	let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)
	if s:temp == "/" || s:temp == "\\"
		let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)
	endif

" 경로 설정
if has("win32")
	let s:dir_tmp = s:home_dir."/_vim/tmp"
	let s:dir_backup = s:home_dir."/_vim/backup"
else
	let s:dir_tmp = s:home_dir."/.vim/tmp"
	let s:dir_backup = s:home_dir."/.vim/backup"
endif

" 임시 디렉토리 설정
	if isdirectory(s:dir_tmp)
		set swf
		let &dir = s:dir_tmp
	else
		set noswf
		set dir=.
	endif

" 백업 디렉토리 설정
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
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 커서의 위치를 항상 보이게 함.
set ru

" 완성중인 명령을 표시
set sc

" 줄 번호 표시
set nu

" 줄 번호 표시 너비 설정
set nuw=5

" 탭 크기 설정
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


" 탭 -> 공백 변환 기능 (사용 안함)
set noet
set sts=0

" 자동 줄바꿈 안함
set nowrapscan

" 마지막 편집 위치 복원 기능
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "norm g`\"" |
\ endif

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
	set cb=unnamed
endif

" magic 기능 사용
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동
set sol

" 비주얼 모드에서의 동작 설정
set sel=exclusive

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
"set km=startsel,stopsel

" 가운데 마우스 버튼으로 붙여넣기 하는 것을 무효화한다.
map <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>

" 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
set mps+=<:>

" 새로 추가된 괄호의 짝을 보여주는 기능
"set sm

" Insert 키로 paste 상태와 nopaste 상태를 전환한다.
" 함수 방식으로 바꾸었다. 자세한 것은 아래로~
"set pt=<Ins>

" 키 입력 대기시간을 무제한으로, 그러나 key codes 에 대해서는 예외
set noto ttimeout

" 키 입력 대기시간 설정 (milliseconds) (ttm 을 음수로 설정하면 tm 을 따라감)
set tm=3000 ttm=100

" 영역이 지정된 상태에서 Tab 과 Shift-Tab 으로 들여쓰기/내어쓰기를 할 수 있도록 함.
vmap <Tab> >gv
vmap <S-Tab> <gv

" 입력이 중단된 후 얼마 후에 swap 파일을 쓸 것인지와
" CursorHold 이벤트의 대기시간을 설정 (milliseconds)
set ut=5000

" 몇 글자를 입력받으면 swap 파일을 쓸 것인지 설정
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

" GUI 이면, 시작시 크기 설정
if has("gui_running")
	set lines=50
	set co=125
endif

" 시작시 전체화면으로 설정
" 이제 이것도 귀찮아졌다...!
if has("win32")
"	au GUIEnter * simalt ~x
endif

" 추적 수준을 최대로
set report=0

" 항상 status 라인을 표시하도록 함.
set ls=2

" 폰트 설정
if has("gui_running")
	if has("win32")
		set gfn=굴림체:h9:cHANGEUL
"		set gfn=GulimChe:h9:cHANGEUL
	elseif has("unix")
		set gfn=monospace\ 9
	endif
"	set gfn=Jung9\ 9
"	set gfn=Fixedsys:h12:cHANGEUL
endif

" 줄 간격 설정
set lsp=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype 기능 & Syntax Highlighting 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 파일의 종류를 자동으로 인식
filet plugin indent on

" 몇몇 커스텀 확장자들에게 파일 형식 설정
"au BufRead,BufNewFile *.dic setl ft=php

" 파일 형식에 따른 Syntax Highlighting 기능을 켠다
"sy enable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 자동 들여쓰기 사용 안함
set noai

" 똑똑한 들여쓰기 사용 안함
set nosi

" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
au FileType javascript,jsp setl cin

" 각 언어의 표준 indent 를 사용하는 경우
" 수동 추가하기가 귀찮아져서 결국 자동 인식으로 바꿨다.
"au FileType c,cpp,html,vim,java,sh,python,xml,perl,xf86conf,conf,apache
"\ if expand("<amatch>") != "" |
"\   if exists("b:did_indent") |
"\		unlet b:did_indent |
"\   endif |
"\ runtime! indent/<amatch>.vim |
"\ endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 컬러 스킴 (:colo desert)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 단축키 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 상용구 설정
iab xdate <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
iab xtime <C-R>=strftime("%H:%M:%S")<CR>
"iab xname 인클루드

" BufExplorer 플러그인 (스크립트 번호: 42)
" :ls 와 :b 에 익숙해져서 이젠 필요없다...
"nnoremap <silent> <F5> :BufExplorer<CR>

" Vim 자체 Explore 기능
" :E 라는 게 있었군...
"nnoremap <silent> <F6> :Explore<CR>

" Vim 정규식이 아닌 진짜 정규식 사용을 의무화(?)
" \v 라는 글자가 항상 표시되니까 햇갈린다... -.-
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
map <F2> :w!<cr>
" Make ctags for c++
map <F3> :!ctags -R --verbose=yes --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <F3> :TrinityToggleNERDTree<cr>
"map <F4> :SrcExplToggle<cr> 
map <F4> :TrinityToggleNERDTree<cr>
map <F5> :TagbarToggle<cr>
"map <F6> :TrinityToggleAll<cr>
"map <F5> :TrinityToggleAll<cr> :set statusline=%F<cr>
"map <F6> :TrinityToggleSourceExplorer<cr> :set statusline=%F<cr>
"map <F7> :TrinityToggleTagList<cr>
"map <F8> :TrinityToggleNERDTree<cr>
map <F6> :call Tj()<cr>
map <F7> :call SplitTj()<cr>
map <F8> :call VertSplitTj()<cr>
map <F9> v]}zf
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
" GUI 간소화
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("gui_running")
if 0

" gVim 메뉴를 사용하지 않는다. 대부분의 명령보다 선행되어야 한다.
"	let did_install_default_menus = 1
"	let did_install_syntax_menu = 1
"	let skip_syntax_sel_menu = 1
" 설정 방식이 바뀌었다.
	set go-=m

" 툴바를 보이지 않게 한다.
	set go-=T

" 스크롤바를 표시하지 않는다.
	set go-=l
	set go-=L
	set go-=r
	set go-=R
	set go-=b

" GUI 여서 마우스가 사용 가능하면...
" 마우스를 사용하지 않는다. (누르면 이동되는게 귀찮다!)
"	set mouse=a
""	set mouse=
	set mouse=nicr

" 마우스 모델을 popup 으로 함.
	set mousem=popup

" '간단한 선택' 다이얼로그가 새 창에서 뜨지 않도록...
	set go+=c

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편리한 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab 자동 완성시 가능한 목록을 보여줌
set wmnu

" 파일 탐색기 설정
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20

" vim -b : xxd 포맷으로 바이너리 파일을 수정합니다! (:help hex-editing)
" ...너무 ㅂㅌ적인 방법인 것 같아서 주석처리;
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

" Spell Checking 기능 (영어)
" 기본적으로는 비활성화
set nospell spelllang=en

" 각종 toggle 기능
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
" 기타 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 매크로 실행중에 화면을 다시 그리지 않음
set lz

" 프로그램 시작시 플러그인 로드
set lpl

"noeol 설정
"au BufNew * set bin | set noeol
"set bin | set noeol

" ㅂㅌ barosl 은 모든 플랫폼에서 unix 줄 변경자를 쓰겠습니다! ..orz
" 경고: 만일 당신의 vim 이 '정상적으로' 동작하길 원하시면,
" 바로 다음줄은 주석처리 하거나 없애세요. -.-;;
"set ff=unix

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
"if executable('ag')
    " Use ag over grep
    "set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
    "let g:ctrlp_use_caching = 0
"endif

" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"nnoremap \ :Ag<SPACE>

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
let g:clang_library_path='/usr/lib64/llvm/libclang.so'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Clang complete
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
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'

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
" for colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switch to a richer palette of up to 18 colors
let g:mwDefaultHighlightingPalette = 'extended'
" switch to a richer palette of up to 27, 58 or even 77, 
" depending on the number of available colors
"let g:mwDefaultHighlightingPalette = 'maximum'

" restrict color number via
let g:mwDefaultHighlightingNum = 9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
"colorscheme benokai
colorscheme solarized
let g:solarized_termcolors = 256
"let g:solarized_contrast = "high"
"let g:solarized_visibility = "high"

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
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'eikenb/acp'
"Plugin 'wesleyche/srcexpl'
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
Plugin 'garbas/vim-snipmate'
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
" End of File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
