if v:progname =~? "evim"
  finish
endif
filetype off

call pathogen#infect()
call pathogen#helptags()

syntax on

set background=dark
set nocompatible
set backspace=indent,eol,start
set tabstop=2
set number
set nowrap
set expandtab
set textwidth=0
set autoindent		" always set autoindenting on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
if !isdirectory($HOME . "/backup")
	call mkdir($HOME . "/backup")
endif
set backupdir=$HOME/backup	" Clean working dir
if !isdirectory($HOME . "/tmp")
	call mkdir($HOME . "/tmp")
endif
set dir=$HOME/tmp		"  -''-

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set mouse=a

augroup filetypedetect
    au BufNewFile,BufRead *.jadd	setf java
    au BufNewFile,BufRead *.jrag	setf java
    au BufNewFile,BufRead *.doxygen setf doxygen
augroup END

if has("terminfo")
	set t_Co=256
	set t_AB=[48;5;%dm
	set t_AF=[38;5;%dm
else
	set t_Co=8
	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif

let mapleader="§" 
let maplocalleader="§" 
map Q gq

vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
filetype plugin on


if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")
let g:ftplugin_sql_omni_key_right = '<Right>'
let g:ftplugin_sql_omni_key_left  = '<Left>'
let g:omni_sql_no_default_maps = 1
let g:python_highlight_all = 1
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_debug = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#313331   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#181811 ctermbg=4

"colorscheme ir_black
au BufNewFile,BufReadPost *.coffee setl expandtab
