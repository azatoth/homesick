if v:progname =~? "evim"
  finish
endif

call pathogen#infect()

let mapleader="§"
set expandtab
set shiftwidth=2
set softtabstop=4
set tabstop=4


colorscheme leo
set nocompatible
set backspace=indent,eol,start
"set tabstop=4
"set softtabstop=4
set number
set nowrap
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
syntax on
let b:undo_ftplugin=""

let Vimplate="$HOME/bin/vimplate"

if has("terminfo")
	set t_Co=256
	set t_AB=[48;5;%dm
	set t_AF=[38;5;%dm
else
	set t_Co=8
	set t_Sf=[3%dm
	set t_Sb=[4%dm
endif

filetype plugin indent on

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

set exrc
set secure
let python_highlight_all = 1
let python_slow_sync = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1

set background=dark
set foldmethod=syntax

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete

au BufNewFile,BufReadPost *.coffee setl expandtab
