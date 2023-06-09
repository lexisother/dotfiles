{ pkgs, dotfiles, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;

    extraConfig = "source ${dotfiles}/nvim/init.vim";

    coc = {
      enable = true;

      settings = {
        languageserver = {
          nix = {
            command = "nil";
            filetypes = [ "nix" ];
            rootPatterns = [ "flake.nix" ];
            "settings.nil" = {
              "formatting.command" = ["nixpkgs-fmt"];
            };
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
