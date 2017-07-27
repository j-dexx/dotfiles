scriptencoding utf-8

" =================================
" General Configuration
" =================================

" Use the space key as our leader. Put this near the top of your vimrc
let mapleader = " "

filetype plugin indent on


""" Tabs #tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2

""" Format Options #format-options
set textwidth=80

""" omni #omni
" enable omni syntax completion
set omnifunc=syntaxcomplete#Complete

" Numbers
set number                      " Display line numbers beside buffer
set relativenumber              " Display relative line numbers beside buffer
set numberwidth=5

" Highlight search results
set hlsearch
" Incremental search, search as you type
set incsearch
" Ignore case when searching
set ignorecase smartcase
" Ignore case when searching lowercase
set smartcase

" Set the title of the terminal tab
set title

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

" add spell checking and automatic wrapping at the recommended
" 72 columns to your commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
highlight SpecialKey ctermfg=red

" Use one space, not two, after punctuation.
set nojoinspaces

" =================================
" File types
" =================================
augroup php
  autocmd!
  autocmd FileType php setlocal tabstop=4
  autocmd FileType php setlocal shiftwidth=4
  autocmd FileType php setlocal colorcolumn=120
augroup END

" =================================
" PLugins
" =================================
call plug#begin('~/.vim/plugged')

" Make sure use single quotes
Plug 'ap/vim-css-color'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rails'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'pbrisbin/vim-mkdir'
Plug 'vim-ruby/vim-ruby' " to ensure latest version
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" For func argument completion - snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets' " default snippets

" Asynchronous completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = ['file', 'neosnippet']
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#input_patterns = {}

" Elixir
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'c-brenn/phoenix.vim' " Like vim-rails but for phoenix
Plug 'tpope/vim-projectionist' " required for some navigation features

" Php
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Use tab for insert completion
Plug 'ervandew/supertab'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Easily manage tags files
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.tags_cache'

" For testing
Plug 'janko-m/vim-test'

" Colorschemes
Plug 'nanotech/jellybeans.vim'

" Add plugins ro &runtimepath
call plug#end()

" Use Ripgrep https://github.com/BurntSushi/ripgrep or The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('rg')
  " Use Rg over Grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m

  " Use rg in CtrlP for listing files.
  let g:ctrlp_user_command = 'rg %s --files -g ""'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Airline config
let g:airline_theme = 'luna'
"let g:airline_theme = 'lucius'
let g:bufferline_echo = 0
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = '∥'
let g:airline#extensions#tabline#enabled = 0

" =================================
" UI
" =================================

" Switch syntax highlighting on, when the terminal has colors
syntax on
if (empty($TMUX))
  if (has('termguicolors'))
    set termguicolors
  endif
endif

set background=dark
" Use the colorscheme from above
colorscheme jellybeans

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
