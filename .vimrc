filetype plugin on
filetype indent on

set number

set autoread 

let mapleader = ","
let g:mapleader = ","

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set incsearch

set noerrorbells
set novisualbell

syntax enable

if has("gui_running")
	set guioptions-=T
	set guioptions+=e
    set guifont=Monospace\ 9
    try
        colorscheme github
    catch /^Vim\%((\a\+)\)\=:E185/
        " none
    endtry
endif

set nobackup
set nowb
set noswapfile

" Indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ai
set si
set wrap

nmap <F1> <Esc>

au BufRead,BufNewFile *.go set filetype=go

" No More Arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set showmode showcmd
set laststatus=2
