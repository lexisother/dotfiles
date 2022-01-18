local neorg = require('neorg')

local ok, cmp = pcall(require, 'cmp')
if not ok then return end;

local cmp_config = cmp.get_config()
table.insert(cmp_config.sources, { name = "neorg" })
cmp.setup(cmp_config)

require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    }
  }
}
