local has_lsp, lsp = pcall(require, 'vim.lsp')
if not (has_lsp and lsp.config ~= nil and vim.g.vim_ide == 2) then return end

require('dotfiles.lsp_ignition').enable({
  'php',
  'biome',
  'vimls',
  'bashls',
})
