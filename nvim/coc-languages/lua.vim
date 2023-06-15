if !has('nvim-0.2.1') | finish | endif
call extend(g:dotfiles_coc_extensions, {'coc-stylua': 1})
let g:coc_user_config['coc.preferences.formatOnSaveFiletypes'] = ['lua']

" We're using Nix here, so point to the right path...
if has('macunix')
  let g:coc_user_config['stylua.styluaPath'] = "/etc/profiles/per-user/alyxia/bin/stylua"
else
  let g:coc_user_config['stylua.styluaPath'] = "/usr/bin/stylua"
endif
