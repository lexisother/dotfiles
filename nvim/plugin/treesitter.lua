local ok, parser_configs = pcall(require, 'nvim-treesitter.parsers')
if not ok then return end

local parser_configs = parser_configs.get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "norg" }
}
