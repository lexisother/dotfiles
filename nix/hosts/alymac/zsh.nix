{ dotfiles, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      export GPG_TTY=$(tty)
      source ${dotfiles}/zsh/zshrc

      [[ -d "$HOME/.local/bin" ]] || mkdir "$HOME/.local/bin"

      export PATH="$PATH:$HOME/.local/bin"
      export PATH="$PATH:$HOME/.npm-packages/bin"
      export FRENYARD_SCALE=2.40
      export RETHINK_API="https://rethink.alyxia.dev"

      function violent-update() {
        # <https://github.com/adryd325/dotfiles/blob/c52d10f0cb4b54ee46e2ac5b01b8be9f8d57973d/install.sh#L17>
        sudo -v; while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
        cd "$HOME/.dotfiles/nix";
        sudo nix-channel --update && nix-channel --update;
        sudo nix-env -u;
      }
    '';
  };
}
