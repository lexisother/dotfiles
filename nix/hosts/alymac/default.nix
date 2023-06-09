{ pkgs, dotfiles, ... }:

let
  packageSets = with pkgs; rec {
    base = [
      jq
      ripgrep
    ];
    languages = [];
    tooling = [];
    multimedia = [];

    everything = base ++ languages ++ tooling ++ multimedia;
  };

in
{
  imports = [];


  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;

  # enable the gpg agent by default
  programs.gnupg.agent.enable = true;

  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;

  # Make sure to set the correct values, or everything will break! (in reality,
  # it will just not build)
  users.users.alyxia = {
    name = "alyxia";
    home = "/Users/alyxia";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.alyxia = { pkgs, ... }: {
      home = {
        packages = packageSets.everything;
      };

      programs.zsh = {
        enable = true;
        initExtra = ''
          export GPG_TTY=$(tty)
          source ${dotfiles}/zsh/zshrc
        '';
      };

      programs.git = {
        enable = true;
        package = pkgs.gitAndTools.gitFull; # contains git send-email et al

        userName = "Alyxia Sother";
        userEmail = "alyxia@riseup.net";

        signing = {
          key = "01E16C4E775A37E4";
          signByDefault = true;
        };

        delta.enable = true;
      };

      programs.gitui.enable = true;

      # DO NOT CHANGE UNLESS YOU ARE ABSOLUTELY SURE ALL STATE AFFECTED BY THIS
      # OPTION IS APPROPRIATELY MIGRATED!!!
      home.stateVersion = "23.05"; # did you read the comment?
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "discord"
    ];
  };
}
