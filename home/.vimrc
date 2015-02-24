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
Plugin 'tpope/vim-rails'
Plugin 'tikhomirov/vim-glsl'
Plugin 'avakhov/vim-yaml'
Plugin 'artoj/qmake-syntax-vim'
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'claco/jasmine.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'digitaltoad/vim-jade'


" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
"
"
if v:progname =~? "evim"
  finish
endif


let mapleader="§"
"set expandtab
"set shiftwidth=2
"set softtabstop=4
"set tabstop=4


colorscheme leo
set nocompatible
set backspace=indent,eol,start
"set tabstop=4
"set softtabstop=4
set number
set wrap
set linebreak
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
let g:localvimrc_ask = 0

:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 4

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'
