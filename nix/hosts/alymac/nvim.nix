{ dotfiles, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    extraConfig = "source ${dotfiles}/nvim/init.vim";

    coc = {
      enable = true;

      settings = {
        languageServer = {
          nix = {
            command = "rnix-lsp";
            filetypes = [ "nix" ];
          };
          "go.goPlsOptions" = {
            completion = true;
            completeUnimported = true;
          };
        };
      };
    };
  };
}
