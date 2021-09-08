let s:plug = funcref('dotfiles#plugman#register')

" UI {{{
  call s:plug('romgrk/barbar.nvim')
  call s:plug('hoob3rt/lualine.nvim')
" }}}

" Files {{{
  call s:plug('preservim/nerdtree')
  call s:plug('kyazdani42/nvim-web-devicons')
  call s:plug('akinsho/nvim-toggleterm.lua')
  call s:plug('antoyo/vim-licenses')
" }}}

" Language specific {{{
  call s:plug('alaviss/nim.nvim')
  call s:plug('stevearc/vim-arduino')
" }}}

" Misc {{{
  if has('nvim-0.5.0')
    call s:plug('andweeb/presence.nvim')
  endif
" }}}
