let s:plug = funcref('dotfiles#plugman#register')

" UI {{{
  if has('nvim')
    call s:plug('romgrk/barbar.nvim')
    call s:plug('hoob3rt/lualine.nvim')
  endif
" }}}

" Navigation {{{
  if has('nvim')
    call s:plug('nvim-telescope/telescope.nvim') " dependencies {{{
      call s:plug('nvim-lua/plenary.nvim')
    " }}}
  endif
" }}}

" Files {{{
  if has('nvim')
    call s:plug('kyazdani42/nvim-web-devicons')
    call s:plug('akinsho/nvim-toggleterm.lua')
  endif
  call s:plug('preservim/nerdtree')
  call s:plug('antoyo/vim-licenses')
" }}}

" Language specific {{{
  if has('nvim')
    call s:plug('xiyaowong/coc-nvim-lua')
    call s:plug('alaviss/nim.nvim')
    if has('unix')
      call s:plug('nvim-neorg/neorg') " dependencies {{{
        call s:plug('nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' })
      " }}}
    endif
  endif
  call s:plug('lervag/vimtex')
  call s:plug('stevearc/vim-arduino')
  call s:plug('luke-gru/vim-riml')
  call s:plug('guns/vim-sexp')
  call s:plug('vim-scripts/newlisp')
  call s:plug('noahfrederick/vim-laravel') " dependencies {{{
    call s:plug('noahfrederick/vim-composer')
    call s:plug('tpope/vim-projectionist')
    call s:plug('tpope/vim-dispatch')
  " }}}
" }}}

" coc {{{
  if g:dotfiles_build_coc_from_source
    call s:plug('https://github.com/UltiRequiem/coc-cl', { 'do': 'yarn install --frozen-lockfile && yarn build' })
  endif
" }}}

" Misc {{{
  if has('nvim')
    call s:plug('andweeb/presence.nvim')
    if has('nvim-0.6.0')
      call s:plug('github/copilot.vim')
    endif
  endif
  call s:plug('junegunn/vader.vim')
  call s:plug('wakatime/vim-wakatime')
" }}}
