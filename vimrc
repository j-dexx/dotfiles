" Use the space key as our leader. Put this near the top of your vimrc
let mapleader = " "

" =================================
" PLugins
" =================================
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles " Plugin config in .vimrc.bundles
endif

" =================================
" General Configuration
" =================================

filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Numbers
set number                      " Display line numbers beside buffer
set relativenumber              " Display relative line numbers
set numberwidth=5

set autoindent
set nocompatible                " Don't maintain compatibilty with Vi.
set hidden                      " Allow buffer change w/o saving
set lazyredraw                  " Don't update while executing macros
set backspace=indent,eol,start  " Sane backspace behavior
set history=1000                " Remember last 1000 commands
set scrolloff=4                 " Keep at least 4 lines below cursor
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" set a colour column at 80 to show lines that are too long
set colorcolumn=80
highlight ColorColumn ctermbg=235

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
highlight SpecialKey ctermfg=red

" Use one space, not two, after punctuation.
set nojoinspaces

" =================================
" Mappings
" =================================

" Map jk and kj to exit insert mode
imap jk <esc>
imap kj <esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" =================================
" Leader Mappings
" =================================

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" For testing
" Vim-test mappings
nnoremap <leader>t :TestFile<cr>
nnoremap <leader>s :TestNearest<cr>
nnoremap <leader>l :TestLast<cr>
nnoremap <leader>a :TestSuite<cr>
nnoremap <leader>g :TestVisit<cr>

"Now using vim-test and tpope/dispatch.
let test#strategy = "dispatch"
