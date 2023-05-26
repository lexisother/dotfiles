alias welcome="welcome --extra-logos-dir $K_ZSH_DOTFILES/../script-resources/welcome/logos"
alias markdown2htmldoc="$K_ZSH_DOTFILES/../scripts/markdown2htmldoc"
alias mediawiki-preview="$K_ZSH_DOTFILES/../scripts/mediawiki-preview"

if (( _is_macos )); then
  if command_exists exa; then
    alias ls="exa --classify --group-directories-first"
  else
    alias ls="ls --group-directories-first --color=auto"
  fi
fi
