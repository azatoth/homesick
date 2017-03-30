set nocompatible              " be iMproved, required
filetype off                  " required

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'artoj/qmake-syntax-vim'
NeoBundle 'burnettk/vim-angular'
"NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'othree/yajs.vim'
NeoBundle 'isRuslan/vim-es6'

"NeoBundleLazy 'othree/yajs', {'autoload':{'filetypes':['javascript', 'es6']}}
NeoBundle 'moll/vim-node'
NeoBundle 'millermedeiros/vim-esformatter'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'

NeoBundle 'Shougo/neocomplete'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'matthewsimo/angular-vim-snippets'

NeoBundle 'Shougo/vimshell'

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'elzr/vim-json'
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'mmozuras/snipmate-mocha'
NeoBundle "Konfekt/FastFold"
NeoBundle "briancollins/vim-jst"
NeoBundle 'bbchung/clighter8'
NeoBundle 'chrisbra/csv.vim'
"NeoBundle 'python-rope/ropevim'
NeoBundle 'python-mode/python-mode'
NeoBundle 'fisadev/vim-isort'


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
let g:vim_json_syntax_conceal = 0

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

set conceallevel=0
set nofoldenable

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"      \ '~/.vim/snippets/snipmate-mocha/snippets',
let g:neosnippet#snippets_directory=[
      \ '~/.vim/snippets/vim-snippets/snippets',
      \ '~/.vim/snippets/angular-vim-snippets/snippets'
      \]

let b:neosnippet_disable_snippet_triggers = ['fname', 'path', 'filename']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 2
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 2

noremap <c-f> :Autoformat<CR>

autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
"autocmd FileType javascript nnoremap <buffer> <c-f> :Esformatter<CR>
autocmd FileType html nnoremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css nnoremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
"autocmd FileType javascript vnoremap <buffer> <c-f> :EsformatterVisual<CR>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

nmap <silent> <Leader>r :ClRenameCursor<CR>

let g:csv_highlight_column = 'y'
let g:csv_autocmd_arrange = 1

let g:pymode_options_max_line_length = 120
let g:formatters_python = ['yapf']

let g:formatdef_yapf = "'yapf --style=\"{dedent_closing_brackets:true,based_on_style:'.g:formatter_yapf_style.',indent_width:'.&shiftwidth.(&textwidth ? ',column_limit:'.&textwidth : '').'}\" -l '.a:firstline.'-'.a:lastline"
let g:formatter_yapf_style = 'google'

let g:pymode_rope = 1
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

set completeopt=menu
let g:pymode_rope_autoimport=1
let g:pymode_doc = 0
let g:pymode_rope_vim_completion=0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport_modules = ["os", "shutil"]
autocmd FileType python setlocal omnifunc=python3complete#Complete

let g:NERDTreeUpdateOnWrite = 0
