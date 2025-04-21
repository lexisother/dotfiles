alias welcome="welcome --extra-logos-dir $A_ZSH_DOTFILES/../script-resources/welcome/logos"
alias markdown2htmldoc="$A_ZSH_DOTFILES/../scripts/markdown2htmldoc"
alias mediawiki-preview="$A_ZSH_DOTFILES/../scripts/mediawiki-preview"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

if command_exists ddev; then
  function craft() {
    [ -f craft ] && ddev craft $@ || return 1
  }
fi

if (( _is_macos )); then
  if command_exists exa; then
    alias ls="exa --classify --group-directories-first"
  else
    alias ls="ls --group-directories-first --color=auto"
  fi
fi
