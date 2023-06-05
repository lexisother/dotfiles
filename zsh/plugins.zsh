#!/usr/bin/env zsh

_plugin() {
  [ -z "$DOTFILES_LOAD_SILENT" ] && _perf_timer_start "plugin $1"
  plugin "$@"
  [ -z "$DOTFILES_LOAD_SILENT" ] && _perf_timer_stop  "plugin $1"
}

# based off of Dima's completion generation code, but made dynamic
# https://github.com/dmitmel/dotfiles/blob/19d80233265629b33cf57daf05a928239b0c73a8/zsh/plugins.zsh#L17-L25
_addcomp() {
  local command_name="$1"
  local command_args="${2:-completion zsh}"
  declare ${command_name}_bin="$(command_locate $command_name)"
  local command_bin="${(P)${:-${command_name}_bin}}"

  if [[ -n "${command_bin}" ]]; then
    declare ${command_name}_comp_path="${ZSH_CACHE_DIR}/site-functions/_${command_name}"
    local comp_path="${(P)${:-${command_name}_comp_path}}"
    if [[ "$command_bin" -nt "$comp_path" || ! -s "$comp_path" ]]; then
      _perf_timer_start "generate $command_name completions"
      eval "$command_bin" "$command_args" >| "$comp_path"
      _perf_timer_stop "generate $command_name completions"
    fi
  fi; unset comp_path
}

_plugin gitio 'denysdovhan/gitio-zsh'

# Load the brilliant project management tool.
_plugin project 'https://git.sr.ht/~keanucode/scripts/blob/master/project/project.zsh' from=url \
  build="wget -O listbox.zsh https://raw.githubusercontent.com/gko/listbox/master/listbox.zsh" \
  load="listbox.zsh" \
  load="project.zsh" \

# Completions {{{
  _addcomp gh "completion -s zsh"
  _addcomp bw "completion --shell zsh"
  _addcomp kubectl

  _plugin nim-compl 'https://raw.githubusercontent.com/nim-lang/Nim/devel/tools/nim.zsh-completion' from=url \
    after_load='plugin-cfg-path fpath prepend ""'

  _plugin keybase-compl 'https://raw.githubusercontent.com/fnoris/keybase-zsh-completion/master/_keybase' from=url \
    after_load='plugin-cfg-path fpath prepend ""'
# }}}
