-- <https://github.com/marlonfan/coc-phpls/blob/master/src/index.ts>

---@type dotfiles.lsp.Config
return {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json', '.phpactor.json', '.phpactor.yml' },
  workspace_required = true,
}
