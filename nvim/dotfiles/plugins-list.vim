" UI {{{
  if has('nvim')
    Plug 'romgrk/barbar.nvim'
    Plug 'hoob3rt/lualine.nvim'
  endif
" }}}

" Navigation {{{
  if has('nvim')
    Plug 'nvim-telescope/telescope.nvim', {
\     'requires': [
\       'nvim-lua/plenary.nvim'
\     ]
\   }
  endif
" }}}

" Files {{{
  if has('nvim')
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/nvim-toggleterm.lua'
  endif
  Plug 'preservim/nerdtree'
  Plug 'antoyo/vim-licenses'
" }}}

" Language specific {{{
  Plug 'lervag/vimtex'
  Plug 'stevearc/vim-arduino'
  Plug 'm-pilia/vim-mediawiki'
  Plug 'aquach/vim-mediawiki-editor'
  Plug 'noahfrederick/vim-laravel', {
\   'requires': [
\     'noahfrederick/vim-composer',
\     'tpope/vim-projectionist',
\     'tpope/vim-dispatch'
\   ]
\ }
" }}}

" mini.nvim {{{
  Plug 'echasnovski/mini.pairs'
" }}}

" Misc {{{
  Plug 'junegunn/vader.vim'
  Plug 'wakatime/vim-wakatime'
" }}}
