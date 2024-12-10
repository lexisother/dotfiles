{ ... }:

{
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
      "the-wineskin-project/wineskin"
    ];

    # Please do not the brew.
    brews = [
      "bear"
      "coder"
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
      "anydesk"
      "audacity"
      "background-music"
      "browserstacklocal"
      "db-browser-for-sqlite"
      "discord"
      "discord@ptb"
      "docker"
      "dolphin@dev"
      "firefox"
      "firefox@developer-edition"
      "goland"
      "google-chrome"
      "imhex"
      "insomnia"
      "intellij-idea"
      "itch"
      "iterm2"
      "lens"
      "minecraft"
      "obs"
      "orbstack"
      "phpstorm"
      "plexamp"
      "qbittorrent"
      "raycast"
      "readdle-spark"
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
      "typora"
      "visual-studio-code"
      "wine-stable"
      "wineskin"
    ];
  };
}
