-- <https://github.com/neovim/nvim-lspconfig/blob/master/lsp/bashls.lua>

---@type dotfiles.lsp.Config
return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  root_markers = { '.git' },

  settings = {
    bashIde = {
      globPattern = '*@(.sh|.bash)',
    },
  },

  build_settings = function(ctx) ctx.settings:merge(ctx.new_settings:pick({ 'bashIde' })) end,
}
