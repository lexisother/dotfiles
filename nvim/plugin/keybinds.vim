nnoremap <C-t> :NERDTreeToggle<CR>

" Completion {{{
  if (dotplug#has('coc.nvim') && g:vim_ide == 1)
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    nmap <silent> <F3>    <Plug>(coc-codeaction-line)
    xmap <silent> <F3>    <Plug>(coc-codeaction-selected)

    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  endif
" }}}

" Copy to clipboard register and paste from clipboard register {{{
  " Taken from https://unix.stackexchange.com/a/23437
  nnoremap <C-y> "+y
  vnoremap <C-y> "+y
  nnoremap <C-p> "+gP
  vnoremap <C-p> "+gP
" }}}
