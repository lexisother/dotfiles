if !has('nvim-0.2.1') | finish | endif
call extend(g:dotfiles_coc_extensions, {'coc-stylua': 1})
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = ['lua']
let g:coc_user_config['stylua.styluaPath'] = "/usr/bin/stylua"
