-- <https://github.com/marlonfan/coc-phpls/blob/master/src/index.ts>

---@type dotfiles.lsp.Config
return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },

  settings_sections = { "intelephense" },
}
