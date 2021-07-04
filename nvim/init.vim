let g:k_nvim_dotfiles_dir = expand('<sfile>:p:h')
let g:k_dotfiles_dir = expand('<sfile>:p:h:h')

let &runtimepath = g:k_nvim_dotfiles_dir.','.&runtimepath.','.g:k_nvim_dotfiles_dir.'/after'

" Enable the clearly superior mode.
let g:vim_ide = 1

" Source Dima's config
source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim

" Give me that beautiful colorscheme
set termguicolors
let airline_powerline_fonts = 1
