local ok, barbar = pcall(require, 'barbar')
if not ok then return end

---@diagnostic disable: missing-fields

barbar.setup({
  icons = {
    buffer_index = true,
    filetype = {
      enabled = true,
    },
  },
}) --[[@as barbar.config.options]]

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Navigating buffers
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-s>', '<Cmd>BufferPick<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
