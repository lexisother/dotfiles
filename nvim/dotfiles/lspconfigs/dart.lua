local ignition = require("dotfiles.lsp.ignition")
local dartls_config = require("lspconfig.server_configurations.dartls").default_config

ignition.setup_config("dartls", dartls_config)
