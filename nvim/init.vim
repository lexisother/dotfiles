" Enable the clearly superior mode.
let g:vim_ide = 1

" Source Dima's config
source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim

" Add keybind for coc-explorer
nmap <space>m :CocCommand explorer<CR>

" Give me that beautiful colorscheme
set termguicolors

" Copy to clipboard register and paste from clipboard register {{{
  " Taken from https://unix.stackexchange.com/a/23437
  nnoremap <C-y> "+y
  vnoremap <C-y> "+y
  nnoremap <C-p> "+gP
  vnoremap <C-p> "+gP
" }}}
