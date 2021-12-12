local utils = require('kdotfiles.utils')
local lspconfig = require('lspconfig')

local file = '/etc/os-release'
local lines = utils.lines_from(file)
local os_name = utils.get_os(lines)

local cmd = (os_name == 'arch') and {'vscode-html-languageserver'} or {'vscode-html-language-server'}
vim.list_extend(cmd, {'--stdio'})

lspconfig['html'].setup({
  cmd = cmd;
  filetypes = {'html', 'handlebars', 'htmldjango', 'blade'};
  completion_menu_label = 'HTML';

  settings_scopes = {'html', 'css', 'javascript'};
  settings = {
    html = {
      format = {
        enable = false;
      };
    };
    javascript = {
      format = {
        enable = false;
      };
    };
    css = {
      format = {
        enable = false;
      };
    };
  };
})
