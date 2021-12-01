let g:k_nvim_dotfiles_dir = expand('<sfile>:p:h')
let g:k_dotfiles_dir = expand('<sfile>:p:h:h')
let &runtimepath = g:k_nvim_dotfiles_dir.','.&runtimepath.','.g:k_nvim_dotfiles_dir.'/after'

let g:vim_ide = 1
let g:dotfiles_rainbow_indent_opacity = 0.5

source <sfile>:p:h/../dmitmel-dotfiles/nvim/init.vim
luafile <sfile>:p:h/init.lua
