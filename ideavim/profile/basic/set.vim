" Common settings
set scrolloff=5              " Keep 5 lines when scrolling
set incsearch                " Incremental search
set hlsearch                 " Highlight search results

set nu                       " Show line numbers
set relativenumber
set number

set tabstop=4                " Number of spaces for a tab
set softtabstop=4            " Number of spaces for a tab when editing
set shiftwidth=4             " Number of spaces for autoindent
set expandtab                " Use spaces instead of tabs
set smartindent             " Smart autoindenting on new lines

set visualbell               " Use visual bell instead of beeping
set noerrorbells             " No error bells

set timeoutlen=300

set clipboard=unnamed,unnamedplus " Use system clipboard for yanking

" Needs to be before quick-scope is sourced!
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
