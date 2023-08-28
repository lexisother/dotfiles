local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
--	{
--		"neovim/nvim-lspconfig",
--		dependencies = {
--			{ "williamboman/mason.nvim", config = true },
--			"williamboman/mason-lspconfig.nvim",
--			{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },
--
--			"folke/neodev.nvim",
--		},
--	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			"hrsh7th/cmp-nvim-lsp",
		},
	},
	{
		"windwp/nvim-autopairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup {}
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on(
				'confirm_done',
				cmp_autopairs.on_confirm_done()
			)
		end,
	},
}, {})
