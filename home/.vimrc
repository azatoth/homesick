set nocompatible              " be iMproved, required
filetype off                  " required

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/azatoth/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/azatoth/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'artoj/qmake-syntax-vim'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'digitaltoad/vim-jade'
NeoBundleLazy 'othree/yajs', {'autoload':{'filetypes':['javascript', 'es6']}}
NeoBundle 'moll/vim-node'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'

NeoBundle 'Shougo/neocomplete'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'matthewsimo/angular-vim-snippets'

NeoBundle 'Shougo/vimshell'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

if v:progname =~? "evim"
  finish
endif


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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:neocomplete#enable_at_startup = 1


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|bower_components|public)$'
  \ }

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
