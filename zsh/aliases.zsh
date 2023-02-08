alias welcome="welcome --extra-logos-dir $K_ZSH_DOTFILES/../script-resources/welcome/logos"

if (( _is_macos )); then
  if command_exists exa; then
    alias ls="exa --classify --group-directories-first"
  else
    alias ls="ls --group-directories-first --color=auto"
  fi
fi
