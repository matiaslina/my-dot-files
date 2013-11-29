filetype plugin on
filetype indent on

set number

set autoread 


set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set noerrorbells
set novisualbell

syntax enable

call pathogen#infect()

if has("gui_running")
	set guioptions-=T

    " Menu
    set guioptions-=m
    " Scrolls
    set guioptions-=l
    set guioptions-=r
    "set guifont=Fira\ Mono\ 9
    set guifont=Fixed\ 10
    colo codeschool
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

set showcmd
"set showmode showcmd
"set laststatus=2
"setglobal cmdheht=1

nmap <F1> <Esc>
nmap <F2> :NERDTreeToggle <cr>
nmap <F3> :TlistToggle <cr>

au BufRead,BufNewFile *.go set filetype=go

" No More Arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" esto es para el haskellmode
let g:haddock_browser="/usr/bin/firefox"
au BufEnter *.hs compiler ghc

" Mapeamos para usar una funcion con el f4
nmap <F4> :GHCi <C-R><C-W> 

" Mostrar menu
let mapleader=","
let g:mapleader=","

function Show_menu()
    if &guioptions =~# 'm'
        set guioptions-=m
    else
        set guioptions+=m
    endif
endfunction

set colorcolumn=0
function Toggle_colorcolumn()
    if &colorcolumn == 0
        set colorcolumn=80
    else
        set colorcolumn=0
    endif
endfunction

nmap <Leader>A :call Show_menu() <cr>
nmap <Leader>p :call Toggle_colorcolumn() <cr>
