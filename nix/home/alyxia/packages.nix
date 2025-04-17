{ pkgs, ... }:

let
  phpEnv = pkgs.php.buildEnv {
    extensions =
      { enabled, all }:
      enabled
      ++ (with all; [
        imagick
      ]);
  };

  packageSets = with pkgs; {
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
      cachix
      cloudflared
      delta
      eza
      ffmpeg
      fzf
      gh
      git-crypt
      gitui
      gnupg
      imagemagick
      kubectl
      kubelogin-oidc
      mosh
      nix-init
      nixd
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
      ghostscript
      go
      jdk
      kotlin
      kotlin-language-server
      lua-language-server
      nil
      nodejs_22
      phpEnv
      phpEnv.packages.composer
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
  };

  everything = builtins.concatLists (builtins.attrValues packageSets);
in
{
  home.packages = everything;
}
