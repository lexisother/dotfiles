local ok, parser_configs = pcall(require, 'nvim-treesitter.parsers')
if not ok then return end

-- Should only really run on my Macbook, as it is my only macOS device.
-- Apple's C compilers seem to not want to compile any of Treesitter's
-- dialects.
-- That is, `cc`, `gcc`, `g++`, andsoforth. Funnily enough, they are all
-- aliases to the same program.
-- So, the nix-darwin configuration specifies the installation of zig as a
-- replacement compiler solely so the Treesitter dialects compile. Very
-- intuitive.
if vim.loop.os_uname().sysname == 'Darwin' then
    require('nvim-treesitter.install').compilers = { "zig" }
end

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
