local ignition = require("dotfiles.lsp.ignition")
local phpactor_config = require("lspconfig.server_configurations.phpactor").default_config

ignition.setup_config("phpactor", phpactor_config)
