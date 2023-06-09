# hosts/YourHostName/default.nix
{ pkgs, dotfiles, ... }:
{
  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
  # Installs a version of nix, that dosen't need "experimental-features = nix-command flakes" in /etc/nix/nix.conf
  # services.nix-daemon.package = pkgs.nixFlakes;

  users.users.alyxia = {
    name = "alyxia";
    home = "/Users/alyxia";
  };
  

  # enable the gpg agent by default
  programs.gnupg.agent.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.alyxia = { pkgs, ... }: {
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
