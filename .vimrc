syntax on               " Turn on syntax hilighting
colorscheme holokai     " Color scheme: http://vimcolors.com/?utf8=%E2%9C%93&bg=dark&colors=any
let mapleader = ","     " Bind the comma key as a trigger for calling functions
set hlsearch            " Higlight your search terms
set encoding=utf-8      " For reading and writing 日本語
set backupcopy=yes      " So Webpack Hot Loader catches file saves

" Replace tabs with spaces, and make tabbing behavior intelligent
" I keep my tabs at 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set smartindent
set autoindent
set ci
set backspace=indent,eol,start  " So we can properly delete EOLs

" Set custom file formatting
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.clj execute ':IcedFormat'
autocmd BufWritePre *.cljs execute ':IcedFormat'
autocmd BufWritePre *.edn execute ':IcedFormat'

" Syntax highlighting for Less and Markdown filetypes
au BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Syntax highlighting for es6
au BufNewFile,BufRead *.es6 set filetype=javascript

" Syntax highlighting for clojure(script)
au BufNewFile,BufRead *.clj* set filetype=clojure

" Automatic syntax formatting
autocmd BufWritePre *.js Prettier
autocmd BufWritePre *.json Prettier
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --parser\ babel\ --single-quote\ --trailing-comma\ es5\ --print-width\ 120
autocmd FileType html setlocal formatprg=prettier\ --stdin\ --parser\ babel\ --single-quote\ --trailing-comma\ es5\ --print-width\ 120
let g:rustfmt_autosave = 1  " Auto-format Rust on save
let g:neoformat_try_formatprg = 1 " Use formatprg when available
let g:neoformat_enabled_javascript = ['prettier-eslint', 'prettier']
let g:neoformat_enabled_json = ['prettier-eslint', 'prettier']
let g:neoformat_enabled_css = ['prettier-eslint', 'prettier']
let g:neoformat_enabled_less = ['prettier-eslint', 'prettier']

" -- PLUGIN MANAGEMENT --
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/sideways.vim'    " Move function arguments quickly
Plug 'christoomey/vim-sort-motion' " Ability to sort within blocks
Plug 'groenewege/vim-less'         " LESS syntax highlighting and autocompletion
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " Realtime Markdown preview
"Plug 'lervag/vimtex'               " Support for LaTeX
Plug 'mxw/vim-jsx'                 " JSX syntax highlighting and indenting
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Web-dev auto-formatting
Plug 'pangloss/vim-javascript'     " Javascript indent and syntax support
Plug 'sbdchd/neoformat'            " Automatic syntax formatting for nearly any language
Plug 'tpope/vim-jdaddy'            " JSON manipulation and pretty printing
Plug 'tpope/vim-surround'          " Intelligence for doing things surrounding other things
Plug 'wakatime/vim-wakatime'       " Code metrics tracking

" Fuzzy pattern matching for quick navigation; a replacement for CtrlP; MUST HAVE `ag` INSTALLED!
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'   " Add directores/files to ignore to ~/.agignore

" Clojure Plugins
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }    " Clojure syntax highlighting
Plug 'guns/vim-sexp', { 'for': 'clojure' }              " S-Expression Precision Editing of Forms
Plug 'liquidz/vim-iced', { 'for': 'clojure' }           " Batteries-included Clojure IDE
Plug 'tpope/vim-classpath', { 'for': 'clojure' }        " Sets the path for JVM languages to match classpath of current project
Plug 'tpope/vim-repeat', { 'for': 'clojure' }           " Allow plugins to take advantage of repeat
Plug 'tpope/vim-salve', { 'for': 'clojure' }            " Static VIM support for Leiningen and Boot
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }        " Clojure REPL
" Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }       " In-buffer auto-formatting of Clojure
Plug 'vim-scripts/paredit.vim', { 'for': 'clojure' }    " Structured editing of Lisp S-expressions

" Plugins for other languages
Plug 'psf/black', {'for': 'python' }          " Python formatter
Plug 'rust-lang/rust.vim', {'for': 'rust' }   " Rust file detection, syntax highlighting, formatting, etc.

call plug#end()

let g:jsx_ext_required = 0
let g:paredit_mode = 0

" Disable folding of markdown files
let g:vim_markdown_folding_disabled=1

" Sideways.vim function param swapping
nmap zh :SidewaysLeft<CR>
nmap zl :SidewaysRight<CR>

" Invoke CtrlP for fuzzy-searching
nmap <leader>b :Buffers<CR>| " Open any file already in the buffer  (FZF)
nmap <leader>f :Files<CR>|   " Open any file in the current (or sub)directory (FZF)

" -- WINDOW MANAGEMENT --
nmap <leader>t :bd<CR>          " Close current buffer
nmap <leader>w :wincmd v<CR>    " Split the screen vertically
nmap <leader>x :wincmd q <CR>   " Quit a window split
nmap <leader>q :wincmd h<CR>    " Jump to the left window
nmap <leader>e :wincmd l<CR>    " Jump to the right window
nmap <leader>j :wincmd j<CR>    " Jump to the above window
nmap <leader>k :wincmd k<CR>    " Jump to the below window
nmap <leader>a :bprev<CR>       " Switch to the previous buffer
nmap <leader>d :bnext<CR>       " Switch to the next buffer

" With smart tabbing and indenting, pasting text into VIM can cause formatting
" problems. I bind the F2 key to toggle 'paste mode' in VIM.
set pastetoggle=<F2>

" This function toggles relative line numbering. This is super handy for
" deleting or moving chunks of code, because you can see exactly how many
" lines you need to modify.
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
        set nonumber
    else
        set relativenumber
    endif
endfunc

" Remember when we bound mapleader to comma earlier? Press comma and
" then r to toggle relative line numbering.
nnoremap <F8> :call NumberToggle()<cr>
nmap <leader>r <F8>

" This function will draw a vertical red bar across column 81. This is handy
" if you're trying to adhere to coding standards that dictate your code should
" be readable in an 120-character console. Turn it on or off with F9 or ,v
function! LineLimitToggle()
    if(&colorcolumn == 120)
        set colorcolumn=0
    else
        set colorcolumn=120
    endif
endfunc

nnoremap <F9> :call LineLimitToggle()<cr>
nmap <leader>v <F9>

" Toggle English spell check in the current document with F10 or ,s
function! SpellToggle()
    if(&spell == 1)
        set nospell
    else
        set spell spelllang=en_us
    endif
endfunc

nnoremap <F10> :call SpellToggle()<cr>
nmap <leader>s <F10>

" Remove trailing whitespace from lines
function! RemoveTrailingWhitespace()
    exe "normal mz"
    :%s/\s\+$//ge
    exe "normal `z"
endfunc
noremap <leader>c :call RemoveTrailingWhitespace()<cr>

function! ReIndent()
    :filetype indent on
    :set smartindent
endfunc
noremap <leader>n :call ReIndent()<cr>

" -- STATUS LINE --
" Filename [filetype] [selected char encoding] [column, line] [%of file]
set statusline=%t%m%r%h%w\ %y\ [\%03.3b,\%02.2B]\ [c=%02v,l=%03l/%03L]\ [%p%%]

" -- vim-iced (Clojure) keybindings --
nmap <C-'> <Plug>(iced_connect)
nmap <C-e> <Plug>(iced_eval)<Plug>(sexp_inner_element)``
nmap <C-o> <Plug>(iced_eval)<Plug>(sexp_outer_list)``
nmap <C-t> <Plug>(iced_eval)<Plug>(sexp_outer_top_list)
nmap <C-p> <Plug>(iced_stdout_buffer_open)
nmap <C-f> <Plug>(iced_format)
nmap <C-a> <Plug>(iced_format_all)

" Use vim-iced for clojure formatting; don't allow sexp formatting
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}
" If using a babashka REPL in vim-iced, make it an nrepl (instead of socket)
let g:iced#repl#babashka_repl_type = 'nrepl'
