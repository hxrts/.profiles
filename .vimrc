
" Pathogen
execute pathogen#infect()

" options
syntax on
filetype plugin indent on

" start NERDTree automatically if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
