vimrc
======

I'm a VIM guy. Here's the vimrc file I use with descriptions about each option.

-------------------------------------------------------------------------------
<pre><code>
syntax on               " turn on syntax hilighting
let mapleader = ","     " bind the comma key as a trigger for calling functions
set hlsearch            " higlight your search terms
set encoding=utf-8      " 日本語が読められるため

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

" -- WINDOW MANAGEMENT --
nmap &lt;leader&gt;w :wincmd v&lt;CR&gt;    " Split the screen vertically
nmap &lt;leader&gt;x :wincmd q&lt;CR&gt;    " Quit a window split
nmap &lt;leader&gt;q :wincmd h&lt;CR&gt;    " Jump to the left window
nmap &lt;leader&gt;e :wincmd l&lt;CR&gt;    " Jump to the right window
nmap &lt;leader&gt;a :bprev&lt;CR&gt;       " Switch to the previous buffer
nmap &lt;leader&gt;d :bnext&lt;CR&gt;       " Switch to the next buffer

" If I need to change my tabbing (for example, if I'm writing some Ruby),
" this function will check to see if you open a Ruby file, and set your
" tab spacing to use Ruby standards.
if has("autocmd")
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2
endif

" With smart tabbing and indenting, pasting text into VIM can cause formatting
" problems.  I bind the F2 key to toggle 'paste mode' in VIM  nice feature!)
set pastetoggle=&lt;F2&gt;

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

nnoremap &lt;F8&gt; :call NumberToggle()&lt;cr&gt;
nmap &lt;leader&gt;r &lt;F8&gt;

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

nnoremap &lt;F9&gt; :call LineLimitToggle()&lt;cr&gt;
nmap &lt;leader&gt;v &lt;F9&gt;

" Toggle English spell check in the current document with F10 or ,s
function! SpellToggle()
    if(&spell == 1)
        set nospell
    else
        set spell spelllang=en_us
    endif
endfunc

nnoremap &lt;F10&gt; :call SpellToggle()&lt;cr&gt;
nmap &lt;leader&gt;s &lt;F10&gt;

" -- STATUS LINE --
" Filename [filetype] [selected char encoding] [column, line] [%of file]
set statusline=%t%m%r%h%w\ %y\ [\%03.3b,\%02.2B]\ [c=%02v,l=%03l/%03L]\ [%p%%]
</code></pre>
