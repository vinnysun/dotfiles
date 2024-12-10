" turn off swap
set noswapfile
set nobackup
set nowb

" dont try to be vi compatible
set nocompatible

filetype off

syntax on

filetype indent on

filetype plugin indent on

let mapleader = ","

" security (?)
set modelines=0

" line numbers
set number

" file stats
set ruler

" blink cursor on error instead of beeping
set visualbell

" encoding
set encoding=utf-8

set term=xterm-256color

" whitespace
set wrap
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>
runtime~ macros/matchit.vim

" move up/down editor lines
nnoremap j gj
nnoremap k gk

" allow hidden buffers
set hidden

" rendering
set ttyfast

" status bar
set laststatus=2

" last line
set showmode
set showcmd

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" count num occurrences
set shortmess-=S
map <leader><space> :let @/=''<cr> " clear search

" remap help key (?)
inoremap <F1> <Esc>:set invfullscreen<CR>a
nnoremap <F1> set invfullscreen<CR>
vnoremap <F1> set invfullscreen<CR>

" formatting
map <leader>q gqip

if has('termguicolors')
  set termguicolors
end

" color scheme (terminal)
set t_Co=256
set background=dark
let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_italicize_strings = 1
let g:gruvbox_improved_warnings = 1
" let g:gruvbox_improved_strings = 1
let g:gruvbox_italic = 1
let g:gruvbox_transparent_bg = 1
let g:airline_theme = 'gruvbox'

" idk lol
set guicursor=n-v-c:block-Cursor/lCursor
let &t_ti.="\e[1 q"
let &t_Si.="\e[5 q"
let &t_Ei.="\e[1 q"
let &t_te.="\e[0 q"

" remap <Esc> to jk in insert
inoremap jk <Esc>

set nofoldenable

set ai
set si

set colorcolumn=81

" start and end of line
nnoremap B ^
nnoremap E $

" move with ctrl-hjkl insetad of ctrl-w + (hjkl)
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

set showtabline=2

" clangd stuff
" run cmake -B . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON in src folder for below
let g:lsc_server_commands = {
\ 'cpp': 'clangd',
\ 'python': 'pylsp'
\}

let g:lsc_auto_map = {
\ 'GoToDefinition': '<C-]>',
\ 'SignatureHelp': 'gm',
\ 'FindReferences': 'gr',
\ 'NextReference': '<C-n>',
\ 'PreviousReference': '<C-p>',
\}
set completeopt-=preview
let g:lsc_enable_autocomplete = v:true
let g:lsc_reference_highlights = v:false

let g:lsc_enable_log = 1
let g:lsc_log_file = expand('~/vimlsc.log')

function! Notes()
  execute 'tabe ~/notes.txt'
  execute 'normal! G'
endfunction

command! Notes call Notes()

function! SwitchHeaderCpp()
  let filename = expand('%')
  if filename =~# '\.h$'
    let basename = substitute(filename, '\.h$', '', '')
    let otherfile = basename . '.cpp'
  elseif filename =~# '\.cpp$'
    let basename = substitute(filename, '\.cpp$', '', '')
    let otherfile = basename . '.h'
  else
    echo 'Not a .h or .cpp file'
    return
  endif
  
  if filereadable(otherfile)
    execute 'edit ' . otherfile
  else
    echo 'Corresponding other file not found: ' . otherfile
  endif
endfunction
map <leader>si :call SwitchHeaderCpp()<CR>

" vim plug stuff
call plug#begin()

Plug 'natebosch/vim-lsc'
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wesQ3/vim-windowswap'

call plug#end()

colorscheme gruvbox

