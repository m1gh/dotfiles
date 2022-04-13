"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
" to detect os type use if has(<option>)
" macunix                 Macintosh version of Vim, using Unix files (OS-X).
" unix                    Unix version of Vim.
" win32                   Win32 version of Vim (MS-Windows 95 and later, 32 or 64 bits)
" win32unix               Win32 version of Vim, using Unix files (Cygwin)

" abbreviations {{{

ab waht what
ab tehn then
ab funciton function
ab teh the
ab tempalte template
ab fitler filter
ab cosnt const
ab attribtue attribute
ab attribuet attribute

" }}}

" functions {{{

" url: https://github.com/ViViDboarder/vim-settings

"let s:is_windows = has('win16') || has('win32') || has('win64')
"let s:is_cygwin = has('win32unix')
"let s:is_sudo = $SUDO_USER !=# '' && $USER !=# $SUDO_USER
      "\ && $HOME !=# expand('~'.$USER)
      "\ && $HOME ==# expand('~'.$SUDO_USER)

"function! s:smart_source_rc(name)
"call s:source_rc(a:name . '.rc.vim')
"call s:source_rc(a:name . '.local.rc.vim')
"endfunction

"function! s:source_rc(path)
"let l:f_path = fnameescape(expand('~/.vim/rc/' . a:path))
"if filereadable(l:f_path)
"execute 'source' . l:f_path
"endif
"endfunction

"function! IsWindows()
"return s:is_windows
"endfunction

"function! IsMac()
"return !s:is_windows && !s:is_cygwin
      "\ && (has('mac') || has('macunix') || has('gui_macvim') ||
      "\   (!executable('xdg-open') &&
      "\     system('uname') =~? '^darwin'))
"endfunction

"function! IsGuiRunning()
"return has('gui_running') || exists('neovim_dot_app')
      "\ || has('gui_win32') || has('gui_macvim')
      "\ || has('gui_vimr') || exists('g:gui_oni')
"endfunction

" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup pluginstall
    autocmd VimEnter * PlugInstall
  augroup end
endif

"call s:smart_source_rc('init')
"call s:smart_source_rc('input')
"call plug#begin()
"call s:smart_source_rc('plugins')
"call plug#end()
"call s:smart_source_rc('ui')

" }}}

" PATH {{{

let &path.="src/include,/usr/include/AL,"

" }}}

" settings {{{

" disable compatibility with vi which can cause unexpected issues.
set nocompatible

" programming-c
set exrc
set secure

" encoding
set enc=utf-8
scriptencoding utf-8

" define leader
let mapleader = ','
let maplocalleader = "'"
let g:loaded_python_provider = 1

syntax on
filetype plugin indent on

" clipboard
if has('clipboard')
  if has('unnamedplus') " When possible use + register for copy-paste
    set clipboard+=unnamed,unnamedplus
  else " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" backup, swap, spelling
set directory=~/.cache/nvim    " swap directory"
set backupdir=~/.cache/nvim    " backup directory"
set backupcopy=yes             " enable safe writes
"set nobackup                   " don't create backup files "
"set noswapfile                 " no swap files "
set nospell                    " disable spelling highlights "
set nowritebackup              " delete backup after write "

" functionality
set autoread                   " auto read files that have changed outside of vim "
set autowrite                  " auto write buffer when switching files "
set autowriteall               " auto write all buffers when switching "
set browsedir=last             " open last directory"
set diffopt+=vertical          " show diff vertically"
set hidden                     " disable warning of hidden buffers "
set history=10000              " show history
set mouse=a                    " enable mouse mode "
set path+=**                   " enable recursive dir paths "
set shell=$SHELL               " use os shell "
set shortmess+=aFc             " don't pass messages to |ins-completion-menu| "
set ttyfast                    " faster redrawing "

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" display
set cursorline                 "hightlight cursor line"
"set cursorcolumn               "hightlight cursor line"
set background=dark            " vim background color "
set linebreak                  " avoid wrapping a line in the middle of a word "
set matchtime=1                " When typing a closing bracket, briefly flash the one it matches "
set number relativenumber      " show hybrid line numbers "
set noshowmode                 " don't show mode "
set ruler                      " enable column and line numbers "
set showbreak=↪                " show break char "
set showcmd                    " show imcomplete commands "
set showmatch                  " highlight matching [{()}] "
set signcolumn=auto            " show sign column "
set splitbelow                 " split below by default "
set splitright                 " split right by default "
" set textwidth=80
set title                      " set title of window to file "
set virtualedit=block          " virtual cursor movements. options: block, insert or all "
set wildmenu                   " wild menu "
set wildmode=longest:list,full " make wild menu behalve like similar to bash completion"

" scroll
set scrolloff=3                " screenlines to keep above and below the cursor "
set sidescrolloff=3            " col to keep to the left and right of the cursor "

" tab control
set autoindent                 " auto indent on new lines set autoread "
set expandtab                  " tabs are spaces "
set shiftround                 " round indentation when shifting lines "
set shiftwidth=2               " shift size after rounding "
set smartindent                " smarter than indent "
set smarttab                   " smart tabbing "
set softtabstop=2              " insert or delete correct number of spaces "
set tabstop=2                  " default tab space "
set expandtab                  " convert tab to spaces "

" folding
set foldlevel=1                " default fold level "
set foldlevelstart=1           " start with folding at level 0 "
set foldmethod=syntax          " marker, indent, syntax "
set foldnestmax=3              " deepest fold is 10 levels "
set modelines=1                " check end of file for folding instructions "
set nofoldenable               " no fold by default (foldenable) "

" status
set cmdheight=1                " better display for message "
set laststatus=2               " always display the status bar "

" search
set gdefault                   " default global search"
set hlsearch                   " highlight search results "
set ignorecase                 " case insensitive searching "
set incsearch                  " set incremental search, like modern browsers "
set magic                      " set magic on, for regex "
set lazyredraw                 " don't redraw while executing macros, option: nolazyredraw "
set smartcase                  " case-sensitive if expression contains a capital letter "

" ignore directories
set wildignore+=**/.git/**                  " git repo "
set wildignore+=**/bower_components/**      " bower build components "
set wildignore+=**/node_modules/**          " node build modules "
set wildignore+=**/target/**                " rust build path "

" ignore files
set wildignore+=*.class
set wildignore+=*.pyc
set wildignore+=*.swp
set wildignore+=*DS_Store*

" gui running
if has('gui_running')
  " set the background tone.
  set background=dark

  " set the color scheme.
  colorscheme molokai

  " set a custom font you have installed on your computer.
  " syntax: set guifont=<font_name>\ <font_weight>\ <size>
  set guifont=Monospace\ Regular\ 12

  " display more of the file by default.
  " hide the toolbar.
  set guioptions-=T

  " hide the the left-side scroll bar.
  set guioptions-=L

  " hide the the right-side scroll bar.
  set guioptions-=r

  " hide the the menu bar.
  set guioptions-=m

  " hide the the bottom scroll bar.
  set guioptions-=b

  " map the F4 key to toggle the menu, toolbar, and scroll bar.
  " <Bar> is the pipe character.
  " <CR> is the enter key.
  nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif

" nvim options
if (has('nvim'))
  " show results of substition without a split
  set inccommand=nosplit
  set fillchars=vert:\|,fold:-

  " enable true colors"
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


if has('macunix') " options: unix, win32, win32unix

  " OSX stupid backspace fix "
  set backspace=indent,eol,start

  " disable netrw
  " let loaded_netrwPlugin=1

  " prevent mac terminal flash issue
  set noerrorbells
  set visualbell
  set t_vb=
  set timeoutlen=500
  set winbl=10               " floating window transparency "
  set wildoptions=pum        " display menu in popup "

  " cursor settings
  " let &t_SI = "\e[6 q"      " Make cursor a line in insert
  " let &t_EI = "\e[2 q"      " Make cursor a line in insert
  " other way of setting cursor"
  " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  " let &t_EI = "\<Esc>]50;CursorShape=0\x7"

endif

" }}}

" plugins {{{

" automatically install vim-plug and run PlugInstall if vim-plug not found
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  augroup nvinstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  augroup end
endif

call plug#begin(expand('~/.config/nvim/plugged'))

" auto follow sym links in vim
Plug 'aymericbeaumet/vim-symlink'

" easy-motion {{{

Plug 'easymotion/vim-easymotion'

"<leader><leader>w        > start of work forward
"<leader><leader>b        > start of words backwards
"<leader><leader>bdw      > start of words everywhere. The bd stands for bidirectional
"<leader><leader>e        > end of words
"<leader><leader>ge       > end of words backwards
"<leader><leader>bdw      > end of words everywhere
"<leader>leader>j         > beginning of lines
"<leader><leader>k        > beginning of lines backwards
"<leader><leader>f{char}  > find character
"<leader><leader>F{char}  > find character backwards
"<leader><leader>t{char}  > until character
"<leader><leader>T{char}  > until character backwards
"<leader><leader>s{char}  > search character everywhere

" }}}

" indentLine {{{

Plug 'Yggdroot/indentLine'

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" }}}


" schemes {{{

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" }}}

call plug#end()

" }}}

" auto commands {{{

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

"set list listchars=trail:.,extends:>
"autocmd FileWritePre * call TrimWhiteSpace()
"autocmd FileAppendPre * call TrimWhiteSpace()
"autocmd FilterWritePre * call TrimWhiteSpace()
"autocmd BufWritePre * call TrimWhiteSpace()

" mapping
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" }}}

" auto commands {{{

augroup configgroup
  au!

  " workaround some broken plugins which set guicursor indiscriminately"
  au OptionSet guicursor noautocmd set guicursor=

  au VimEnter * highlight clear SignColumn

  " quit readonly files with q instead of :q
  au FileType help noremap <buffer> q :bd<cr>

  " Autocomand to remember last editing position
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " remove scrolloff in terminal
  au TermEnter,TermLeave * setlocal scrolloff=0 sidescrolloff=0
augroup END

" }}}

" mappings {{{

" disabled keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" disable, remap esc
inoremap jk <esc>
inoremap kj <esc>
cnoremap jk <esc>
cnoremap kj <esc>
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

"remap command toggle"
nnoremap ; :
nnoremap : ;

" moving up and down work as you would expect "
nnoremap <silent> j gj
nnoremap <silent> k gk

" exit after inserting line
"nnoremap o o<esc>
"nnoremap O O<esc>

" use qq to record, q to stop, Q to play a macro "
nnoremap Q @q
vnoremap Q :normal @q

" easy caps "
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<ESC>

" scroll the viewport faster "
nnoremap <silent> <C-e> 3<C-e>
nnoremap <silent> <C-y> 3<C-y>

" enable . command in visual mode "
vnoremap . :normal .<cr>

" go to middle of line "
nnoremap gm :call cursor(0, virtcol('$')/2)<CR>

" keep visual selection when indenting/outdenting "
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" highlight last inserted text "
nnoremap <silent> gV `[v`]

" folding "
nnoremap <space> za
vnoremap <space> za

" edit, source vim file "
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" move to window "
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-l> <C-w>l

" use arrows to resize windows "
noremap <right> <c-w><
noremap <left>  <c-w>>
noremap <up>    <c-w>+
noremap <down>  <c-w>-

" remap exit "
tnoremap <silent> <esc> <C-\><C-n>

" save with sudo "
cnoremap w!! w !sudo tee %

" terminal mappings "
" To simulate |i_CTRL-R|
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" repeat last command "
nnoremap <leader>bb @:

" format
nnoremap <leader>ff gg=G

" search - center the cursor when searching
nnoremap n nzz
nnoremap N Nzz

" yank till end of line
nnoremap Y y$

" delete line in insert mode
inoremap <c-d> <esc>ddi

" help mappings
nnoremap <buffer> <CR> <C-]>
nnoremap <buffer> <BS> <C-T>
"nnoremap <buffer> o /'\l\{2,\}'<CR>
"nnoremap <buffer> O ?'\l\{2,\}'<CR>
"nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
"nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" }}}

colorscheme dracula
"colorscheme gruvbox
"colorscheme onehalfdark

"let g:lightline = { 'colorscheme': 'onehalfdark' }
let g:lightline = { 'colorscheme': 'dracula' }
