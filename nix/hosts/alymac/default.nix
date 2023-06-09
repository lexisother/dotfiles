{ pkgs, dotfiles, ... }:

let
  packageSets = with pkgs; rec {
    system = [
      gnutls
      gsasl
      libtool
      patchelf
      pcre
      pkg-config
    ];

    base = [
      act
      bat
      bitwarden-cli
      cloudflared
      delta
      exa
      ffmpeg
      fzf
      gh
      git-crypt
      gitui
      gnupg
      jq
      kubectl
      kubelogin-oidc
      mosh
      nixpkgs-fmt
      ripgrep
      sops
      vim
      wget
    ];

    languages = [
      crystal
      deno
      dotnet-sdk
      go
      jdk
      nil
      nodejs_20
      ruby_3_1
      sbcl
      shards
      zig
    ];

    programs = [
      jetbrains.idea-ultimate
      jetbrains.phpstorm
      jetbrains.rider
      rectangle
      slack
      tailscale
    ];

    multimedia = [
      ffmpeg
    ];

    everything = system ++ base ++ languages ++ programs ++ multimedia;
  };

in
{
  # Absolutely proprietary.
  nixpkgs.config.allowUnfree = true;

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
    extraSpecialArgs =  { inherit dotfiles; };
    users.alyxia = { pkgs, ... }: {
      imports = [ ./zsh.nix ./git.nix ./nvim.nix ];

      home = {
        packages = packageSets.everything;

        file.".npmrc".text = ''
          prefix = ''${HOME}/.npm-packages
        '';
      };

      # DO NOT CHANGE UNLESS YOU ARE ABSOLUTELY SURE ALL STATE AFFECTED BY THIS
      # OPTION IS APPROPRIATELY MIGRATED!!!
      home.stateVersion = "23.05"; # did you read the comment?
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "drud/ddev"
      "homebrew/cask"
      "homebrew/cask-versions"
    ];

    # Please do not the brew.
    brews = [
      "composer"
      "croc"
      "ddev"
      "mkcert"
      "pinentry-mac"
      "pkg-config"
      "sdl2"
    ];

    casks = [
      "1password"
      "1password-cli"
      "alt-tab"
      "android-studio"
      "audacity"
      "background-music"
      "db-browser-for-sqlite"
      "discord"
      "discord-ptb"
      "docker"
      "firefox"
      "google-chrome"
      "itch"
      "iterm2"
      "obs"
      "raycast"
      "sequel-ace"
      "shottr"
      "spotify"
      "thunderbird"
      "visual-studio-code"
    ];
  };
}
