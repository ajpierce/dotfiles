syntax on               " turn on syntax hilighting
let mapleader = ","     " bind the comma key as a trigger for calling functions
set hlsearch            " higlight your search terms

" Replace tabs with spaces, and make tabbing behavior intelligent
" I keep my tabs at 4 spaces, per the Python standard.
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set smartindent
set autoindent
set ci

" If I need to change my tabbing (for example, if I'm writing some Ruby),
" this function will check to see if you open a python file, and set your
" tab spacing to use Python standards.
if has("autocmd")
    autocmd FileType python setlocal ts=4 sts=4 sw=4
endif

" With smart tabbing and indenting, pasting text into VIM can cause formatting
" problems.  I bind the F2 key to toggle 'paste mode' in VIM  nice feature!)
set pastetoggle=<F2>

" This function toggles relative line numbering. This is super handy for
" deleting or moving chunks of code, because you can see exactly how many
" lines you need to dd; I used to go into visual mode for this; no more!
" 
" Also, remember when we bound mapleader to comma earlier? Press comma and
" then r to toggle relative line numbering! Or F8, but ,r is faster ;)
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set nonumber
    else
        set relativenumber
    endif
endfunc

nnoremap <F8> :call NumberToggle()<cr>
nmap <leader>r <F8>

" This function will draw a vertical red bar across column 80. This is handy
" if you're trying to adhere to coding standards that dictate your code should
" be readable in an 80-character console. Turn it on or off with F9 or ,v
function! LineLimitToggle()
    if(&colorcolumn == 80)
        set colorcolumn=0
    else
        set colorcolumn=80
    endif
endfunc

nnoremap <F9> :call LineLimitToggle()<cr>
nmap <leader>v <F9>
