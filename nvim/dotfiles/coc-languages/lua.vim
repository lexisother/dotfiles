if !has('nvim-0.2.1') | finish | endif
call dotutils#add_unique(g:coc_global_extensions, 'coc-stylua')
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = ['lua']

if exepath('stylua')
  let g:coc_user_config['stylua.styluaPath'] = exepath('stylua')
endif
