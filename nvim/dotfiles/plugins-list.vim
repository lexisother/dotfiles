exe dotplug#define_plug_here()

" UI {{{
  if has('nvim')
    " Plug 'romgrk/barbar.nvim'
    " Plug 'hoob3rt/lualine.nvim'
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
  Plug 'm-pilia/vim-mediawiki'
  Plug 'aquach/vim-mediawiki-editor'
" }}}

" Misc {{{
  Plug 'wakatime/vim-wakatime'
" }}}

delcommand Plug
