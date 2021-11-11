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
  call s:plug('xiyaowong/coc-nvim-lua')
  call s:plug('noahfrederick/vim-laravel') " dependencies {{{
    call s:plug('noahfrederick/vim-composer')
    call s:plug('tpope/vim-projectionist')
    call s:plug('tpope/vim-dispatch')
  " }}}

" }}}

" Misc {{{
  if has('nvim-0.5.0')
    call s:plug('andweeb/presence.nvim')
  endif
  if has('nvim-0.6.0')
    call s:plug('github/copilot.vim')
  endif
  call s:plug('wakatime/vim-wakatime')
" }}}
