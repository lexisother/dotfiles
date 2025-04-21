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
