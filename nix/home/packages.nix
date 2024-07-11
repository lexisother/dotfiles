{ pkgs, ... }:

let
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
      bitwarden-cli
      cloudflared
      delta
      eza
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
  };
  everything = builtins.concatLists (builtins.attrValues packageSets);

in
{
  home.packages = everything;
}
