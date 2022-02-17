local okn, neorg = pcall(require, 'neorg')
if not okn then return end;

local okc, cmp = pcall(require, 'cmp')
if not okc then return end;

local cmp_config = cmp.get_config()
table.insert(cmp_config.sources, { name = "neorg" })
cmp.setup(cmp_config)

neorg.setup {
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
