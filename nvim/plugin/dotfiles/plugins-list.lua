local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  -- Stop packer from trying to remove itself
  use({ "wbthomason/packer.nvim" })

  -- UI {{{
  use({
    "tomasiser/vim-code-dark",
    config = function()
      vim.cmd("colorscheme codedark")
    end,
    --'jacoborus/tender.vim',
    --config = function()
    --	vim.cmd("colorscheme tender")
    --end
  })
  use({
    "famiu/feline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({})
    end,
  })
  -- }}}

  -- Editing {{{
  use({ "Raimondi/delimitMate" })
  use({ "tomtom/tcomment_vim" })
  use({ "tpope/vim-sleuth" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/nvim-lsp-installer" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "dcampos/nvim-snippy" })
  use({
    "hrsh7th/nvim-cmp",
    branch = "main",
    requires = {
      {
        "hrsh7th/cmp-nvim-lsp",
        branch = "main",
      },
      { "hrsh7th/cmp-buffer", branch = "main" },
      {
        "hrsh7th/cmp-path",
        branch = "main",
      },
      {
        "dcampos/cmp-snippy",
      },
    },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  -- }}}

  -- Text objects {{{
  use({ "kana/vim-textobj-user" })
  use({ "kana/vim-textobj-entire" })
  use({ "kana/vim-textobj-line" })
  use({ "kana/vim-textobj-indent" })
  use({ "glts/vim-textobj-comment" })
  -- }}}

  -- Misc {{{
  use({ "lewis6991/impatient.nvim" })
  use({ "dstein64/vim-startuptime" })
  -- }}}

  -- Automatically install plugins after packer is installed
  if packer_bootstrap then
    require("packer").sync()
  end
end)
