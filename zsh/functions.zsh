#!/usr/bin/env zsh

silence() { $1 &>/dev/null }

# Utility for recovering environment variable files when moving devices,
# provided they are in a central backup dir
function recover-env() {
  local PWD="$(pwd)"
  local backup_dir="$HOME/Documents/envs"

  if ! [ -d "$backup_dir" ]; then
    echo "No backup dir found. Bailing."
    return 1
  fi

  local project="$1"
  if [ "$#" -eq 0 ] || [ -z "$1" ]; then
    echo "No arguments specified, using current folder as project name."
    local project="$(basename "$PWD")"
  fi

  if ! [ -f "$backup_dir/$project.env" ]; then
    echo "No .env file for this project found. Bailing."
    return 1
  fi

  cp "$backup_dir/$project.env" "$PWD/.env"
  echo "$project.env restored to .env"
}

# https://github.com/dmitmel/dotfiles/blob/a174ef1556c440ca8cb7ee23bf1731290b9d22ce/zsh/functions.zsh#L114-L134
SYNC_WORKING_DIR_STORAGE="${ZSH_CACHE_DIR}/last-working-dir"

autoload -Uz add-zsh-hook
add-zsh-hook chpwd sync_working_dir_chpwd_hook
sync_working_dir_chpwd_hook() {
  if [[ "$ZSH_SUBSHELL" == 0 ]]; then
    sync_working_dir_save
  fi
}

sync_working_dir_save() {
  pwd >| "$SYNC_WORKING_DIR_STORAGE"
}

sync_working_dir_load() {
  local dir
  if dir="$(<"$SYNC_WORKING_DIR_STORAGE")" 2>/dev/null && [[ -n "$dir" ]]; then
    cd -- "$dir"
  fi
}
alias cds="sync_working_dir_load"
