nnoremap <C-t> :NERDTreeToggle<CR>

" Copy to clipboard register and paste from clipboard register {{{
  " Taken from https://unix.stackexchange.com/a/23437
  nnoremap <C-y> "+y
  vnoremap <C-y> "+y
  nnoremap <C-p> "+gP
  vnoremap <C-p> "+gP
" }}}
