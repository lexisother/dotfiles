print("yes")

local options = {
	termguicolors = true, -- how do I even use the editor without this?
}

for o, _ in pairs(options) do
	vim.opt[o] = _
end

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
