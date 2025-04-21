" UI {{{
  if has('nvim')
    call s:plug('romgrk/barbar.nvim')
    call s:plug('hoob3rt/lualine.nvim')
  endif
" }}}

" Navigation {{{
  if has('nvim')
    call s:plug('nvim-telescope/telescope.nvim', {
\     'requires': [
\       'nvim-lua/plenary.nvim'
\     ]
\   })
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
    if has('unix')
      call s:plug('nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' })
    endif
  endif
  call s:plug('lervag/vimtex')
  call s:plug('stevearc/vim-arduino')
  call s:plug('m-pilia/vim-mediawiki')
  call s:plug('aquach/vim-mediawiki-editor')
  call s:plug('noahfrederick/vim-laravel', {
\   'requires': [
\     'noahfrederick/vim-composer',
\     'tpope/vim-projectionist',
\     'tpope/vim-dispatch'
\   ]
\ })
" }}}

" coc {{{
  if g:dotfiles_build_coc_from_source
    call s:plug('https://github.com/UltiRequiem/coc-cl', {
\     'do': 'yarn install --frozen-lockfile && yarn build'
\   })
  endif
" }}}

" mini.nvim {{{
  call s:plug('echasnovski/mini.pairs')
" }}}

" Misc {{{
  call s:plug('junegunn/vader.vim')
  call s:plug('wakatime/vim-wakatime')
" }}}
