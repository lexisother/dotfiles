let g:k_nvim_dotfiles_dir = expand('<sfile>:p:h')
let g:k_dotfiles_dir = expand('<sfile>:p:h:h')

let &runtimepath = g:k_nvim_dotfiles_dir.','.&runtimepath.','.g:k_nvim_dotfiles_dir.'/after'

" Enable the clearly superior mode.
let g:vim_ide = 1

" Source Dima's config
source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim

" Give me that beautiful colorscheme
set termguicolors

" Copy to clipboard register and paste from clipboard register {{{
  " Taken from https://unix.stackexchange.com/a/23437
  nnoremap <C-y> "+y
  vnoremap <C-y> "+y
  nnoremap <C-p> "+gP
  vnoremap <C-p> "+gP
" }}}
