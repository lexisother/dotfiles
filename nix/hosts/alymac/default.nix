{ self, pkgs, lib, dotfiles, ... }:

with lib;
let
  textEditor = "nvim";

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
      pandoc
      ripgrep
      sops
      stylua
      texlive.combined.scheme-small
      typst
      vim
      wget

      # Fyra
      glib-networking
      meson
      ninja
      vala
      desktop-file-utils
    ];

    languages = [
      crystal
      dhall
      dhall-json
      dhall-lsp-server
      go
      jdk
      kotlin
      kotlin-language-server
      lua-language-server
      nil
      nodejs_20
      python2
      ruby_3_1
      sbcl
      shards
      zig
    ];

    programs = [
      rectangle
      tailscale
    ];

    multimedia = [
      ffmpeg
    ];

    fonts = [
      nerdfonts
      ibm-plex
    ];

    python = with python311Packages; [
      colorama
      psutil
      distro
    ];

    everything = system ++ base ++ languages ++ programs ++ multimedia ++ fonts ++ python;
  };

  # Old solution kept for posterity {{{
  # We've got a small issue here. I tested this in a repl, and what I've
  # observed is that listFilesRecursive spits out [ /full/path/to/default.nix ],
  # while builtins.readDir spits out { "default.nix" = "regular"; }
  # In theory, this shouldn't be much of an issue, however, when using readDir
  # I would be able to do `map (n: "${./.}/${n}"), while when using
  # listFilesRecursive I have to use `map (n: "${n}").
  # The difference here is that when using listFilesRecursive, `n` becomes
  # `/nix/store/<ID>-default.nix`, meaning it can be used as-is, but when using
  # `readDir` it becomes `default.nix`, meaning the string used in the map
  # callback must be `"${./.}/${n}"` to get a path to the current derivation
  # where the nix file lives in.
  # Currently, I am unsure of the implications of having all files separately.
  # To do it "the right way" I'd obviously prefer the nix files to be children
  # of the alymac derivation, but it seems that if I want my map of imports to
  # be generated from the entire directory listing, it isn't going to work out.
  # The solution was slightly modified from this Reddit answer:
  # <https://www.reddit.com/r/NixOS/comments/j5pa9o/comment/g81dvop/>
  # importMap = map
  #   (n: "${n}")
  #   (lib.filesystem.listFilesRecursive ./.);
  # importsFiltered =
  #   builtins.filter
  #     (x: !lib.strings.hasInfix "default" x)
  #     importMap;
  # }}}

  getDir = dir: mapAttrs
    (file: type:
      if type == "directory" then getDir "${dir}/${file}" else type
    )
    (builtins.readDir dir);

  files = dir: collect isString (mapAttrsRecursive
    (path: type: concatStringsSep "/" path)
    (getDir dir));

  validFiles = dir: map
    (file: ./. + "/${file}")
    (filter
      (file: hasSuffix ".nix" file && file != "default.nix")
      (files dir));

in
{

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      build-users-group = "nixbld";
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 8d";
    };
  };

  # Absolutely proprietary.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.6"
  ];

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;

  # enable the gpg agent by default
  programs.gnupg.agent.enable = true;

  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh.enable = true;

  # tailscaled isn't automatically registered as a service that should run on installation.
  services.tailscale.enable = true;

  # Make sure to set the correct values, or everything will break! (in reality,
  # it will just not build)
  users.users.alyxia = {
    name = "alyxia";
    home = "/Users/alyxia";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit self; inherit dotfiles; };
    users.alyxia = { pkgs, ... }: {
      # Defined further above, generates a list of files to import.
      imports = validFiles ./.;

      home = {
        packages = packageSets.everything;
        sessionVariables = {
          EDITOR = textEditor;
        };

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
      "homebrew/cask-versions"
      "int128/kubelogin"
    ];

    # Please do not the brew.
    brews = [
      "bear"
      "composer"
      "croc"
      "ddev"
      "deno"
      "dotnet"
      "ferium"
      "gradle"
      "kubelogin"
      "mkcert"
      "nss"
      "pinentry-mac"
      "pkg-config"
      "poetry"
      "rustup"
      "sdl2"

      # Fyra crap, but from Homebrew because someone doesn't know how to
      # package libraries in nixpkgs
      "appstream-glib"
      "glib"
      "gobject-introspection"
      "gsettings-desktop-schemas"
      "gtk4"
      "gtksourceview5"
      "libgee"
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
      "firefox-developer-edition"
      "goland"
      "google-chrome"
      "intellij-idea"
      "itch"
      "iterm2"
      "lens"
      "minecraft"
      "obs"
      "orbstack"
      "phpstorm"
      "plexamp"
      "raycast"
      "rider"
      "rubymine"
      "sequel-ace"
      "shottr"
      "slack"
      "spotify"
      "steam"
      "texifier"
      "thunderbird"
      "transmit"
      "visual-studio-code"
      "wine-stable"
    ];
  };
}
