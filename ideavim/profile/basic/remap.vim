let mapleader = " "

imap jj <ESC>
imap jk <ESC>

nnoremap <silent> <C-l> :nohlsearch<CR>

" to copy text to the end-of-line, press y.
" this mapping sets up y to be consistent with
" the c and d operators, which act from the cursor
" to the end of the line. the default behavior of y
" is to yank the whole line.
nnoremap Y y$

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>D "_D
vnoremap <leader>D "_D

vnoremap <leader>p "_dP

nnoremap <leader><leader> :so %<CR>
