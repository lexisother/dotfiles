{ config, pkgs, ... }:

{
  networking = {
    hostName = "alymac";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bat
    bitwarden-cli
    crystal
    delta
    deno
    exa
    ffmpeg
    fzf
    git
    gnupg
    go
    jq
    mosh
    neovim
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.yarn
    nodejs-19_x
    openssl
    pcre
    pkg-config
    rectangle
    ripgrep
    ruby_3_1
    tailscale
    shards
    slack
    slack-term
    vim
    wget
    zig
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [
      "homebrew/cask"
      "drud/ddev"
    ];

    brews = [
      "composer"
      "ddev"
      "sdl2"
      "pkg-config"
    ];

    casks = [
      "alt-tab"
      "amethyst"
      "discord"
      "docker"
      "fig"
      "firefox"
      "google-chrome"
      "iterm2"
      "nss"
      "obs"
      "raycast"
      "sequel-ace"
      "shortcat"
      "shottr"
      "spotify"
      "thunderbird"
      "visual-studio-code"
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Configuration for nix itself.
  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 8d";
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh = {
    enable = true;
    promptInit = "
      source ~/.dotfiles/zsh/zshrc
    ";
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  nixpkgs.config.allowUnfree = true;
}


#  services.yabai = {
#    enable = true;
#    enableScriptingAddition = true;
#    config = {
#      layout = "bsp";
#      window_placement = "first_child";
#      auto_balance = "on";
#
#      focus_follows_mouse = "autoraise";
#
#      window_topmost = "on";
#
#      window_opacity = "on";
#      active_window_opacity = "1.0";
#      normal_window_opacity = "0.9";
#    };
#
#    extraConfig = "
#      yabai -m signal --add event=dock_did_restart action=\"sudo yabai --load-sa\"
#      sudo yabai --load-sa
#    ";
#  };
#
#  services.skhd = {
#    enable = true;
#    skhdConfig = "
#      # Toggle split
#      shift + cmd - enter : /run/current-system/sw/bin/yabai -m window --toggle split
#
#      # Focus window
#      ctrl + cmd - up : /run/current-system/sw/bin/yabai -m window --focus north
#      ctrl + cmd - right : /run/current-system/sw/bin/yabai -m window --focus east
#      ctrl + cmd - down : /run/current-system/sw/bin/yabai -m window --focus south
#      ctrl + cmd - left : /run/current-system/sw/bin/yabai -m window --focus west
#
#      # Move windows
#      shift + cmd - left : /run/current-system/sw/bin/yabai -m window --warp west
#      shift + cmd - right : /run/current-system/sw/bin/yabai -m window --warp east
#
#      # Focus monitor
#      ctrl + alt - z : /run/current-system/sw/bin/yabai -m display --focus prev
#
#      # Increase window size
#      shift + alt - a : /run/current-system/sw/bin/yabai -m window --resize left:-20:0
#      shift + alt - w : /run/current-system/sw/bin/yabai -m window --resize top:0:-20
#
#      # Decrease window size
#      shift + cmd - s : /run/current-system/sw/bin/yabai -m window --resize bottom:0:-20
#      shift + cmd - w : /run/current-system/sw/bin/yabai -m window --resize top:0:20
#    ";
#  };
