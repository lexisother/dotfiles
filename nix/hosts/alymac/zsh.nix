{ dotfiles, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      export GPG_TTY=$(tty)
      source ${dotfiles}/zsh/zshrc

      export PATH="$PATH:$HOME/.npm-packages/bin"
      export FRENYARD_SCALE=2.40
      export RETHINK_API="https://rethink.alyxia.dev"
    '';
  };
}
