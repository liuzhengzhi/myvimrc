"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""Vunble""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off "required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"power-liner
Bundle 'https://github.com/LoKaltog/vim-powerline.git'
"vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
"cpp.vim
"Bundle 'cpp.vim'
"NERD tree
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'octol/vim-cpp-enhanced-highlight'
""""""语法检查
Bundle 'scrooloose/syntastic'
""""""""""Python
""Bundle 'orenhe/pylint.vim'
"""""""YCM
Bundle 'Valloric/YouCompleteMe'
""Minibuffer
Bundle 'minibufexpl.vim'
""xtemplete
Bundle 'drmingdrmer/xptemplate'
""jedi python的补全
Bundle 'davidhalter/jedi'
""调试gdb
Bundle 'vim-scripts/Conque-GDB'
""CtrlP
Bundle 'kien/ctrlp.vim'
""Tagbar
Bundle 'majutsushi/tagbar'
""easymotion
Bundle 'easymotion/vim-easymotion'
filetype plugin indent on "
""""""""""""""""""""""""""""""end of Vundle""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""vim-powerline""""""""""""""""""""""""""""""""""
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf-8
set fencs=utf-8,gbk
""""""""""""""""""""""""""""end of powerline""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""nerdter"""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree "设置开启vim时即打开nerdter
let g:NERDTreeWinSize=16
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""""""""""""""""""""""""""""""""""end""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""ctags"""""""""""""""""""""""""""""""""""""""
set tags=tags;
"""""""""""""""""""""""""""""end"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""map setting"""""""""""""""""""""""""""""""""
let mapleader =","
let maplocalleader="."
""快速打开vim配置文件
nnoremap <leader>ev :split $MYVIMRC<cr>
""重读vim配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>
""使用外部粘贴板
nnoremap <C-v> "+gp
""防止main函数输错的映射
iabbrev mian main
iabbrev csont const
""插入我的邮箱
"iabbrev @@ liuhiter@gmail.com
""自动命令组
augroup filetype_cppc
autocmd!
""C,C++整行注释
autocmd filetype cpp nnoremap <buffer><localleader>c I//<esc>
autocmd filetype c nnoremap <buffer><localleader>c I//<esc>
autocmd filetype cpp map <F5> <Esc>:w!<CR>:!clang++ -std=c++11 % -o %< <CR>
autocmd filetype c map <F5> <Esc>:w!<CR>:!clang -std=c99 % -o %< -lm <CR>
augroup END
""""""vim脚本自动折叠""""""""""""""""""""""""""""""""""""""""""""
"""""Vimscript file settings-------------{{{
augroup filetype_vim
autocmd!
autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""<F5>"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""end"""""""""""""""""""""""""""""""""""""""""
"""""""""""other things""""""""""""""""""""""""""""""""""""""""""""""""""""
set number ""显示行号
set encoding=utf8
set nocompatible "关闭vi兼容
set tabstop=4	"设定tab = 4
set softtabstop=4
set shiftwidth=4
""实现语法高亮
syntax enable
syntax on
""搜索高亮
set hlsearch incsearch
""背景
colorscheme PerfectDark
""隐藏状态栏，美观一下
set guioptions=P
""覆盖文件时不备份
set nobackup
""编辑时不产生交换文件
set noswapfile
""开启自动缩进
set autoindent
""开启新行时自动缩进
set smartindent
""C样式缩进
set cindent
""使用Tab缩进
set smarttab
""""""""""""""""""""end""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""YCM""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu,preview
autocmd InsertLeave * if pumvisible()==0|pclose|endif
inoremap <expr><CR> pumvisible()?'<C-y>':'<CR>'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
""""""""""""""""""""""""end""""""""""""""""""""""""""""""""
""""""""""""""""""""""""syntastic""""""""""""""""""""""""""
""let g:syntastic_ignore_files=[".*\.py$"]
""""""""""""""""""""""""xptemplate"""""""""""""""""""""""""
let g:xptemplate_vars="SPcmd=&BRloop=\n"
let g:xptemplate_vars.="&BRfun= "
let g:xptemplate_vars.="&SParg="
let g:xptemplate_brace_complete ='([{"<'
let g:xptemplate_vars.="&author=liu"
let g:xptemplate_vars.="&email=liuhiter@gmail.com"

""""""""""""""""""Tagbar""""""""""""""""""""""""""""""""
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
