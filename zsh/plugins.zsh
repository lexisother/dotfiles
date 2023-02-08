#!/usr/bin/env zsh

_plugin() {
  [ -z "$DOTFILES_LOAD_SILENT" ] && _perf_timer_start "plugin $1"
  plugin "$@"
  [ -z "$DOTFILES_LOAD_SILENT" ] && _perf_timer_stop  "plugin $1"
}

_plugin gitio 'denysdovhan/gitio-zsh'

# Load the brilliant project management tool.
_plugin project 'https://git.sr.ht/~keanucode/scripts/blob/master/project/project.zsh' from=url \
  build="wget -O listbox.zsh https://raw.githubusercontent.com/gko/listbox/master/listbox.zsh" \
  load="listbox.zsh" \
  load="project.zsh" \

# Completions {{{
  # from Dima, assuming it's based off of:
  # https://github.com/dmitmel/dotfiles/blob/19d80233265629b33cf57daf05a928239b0c73a8/zsh/plugins.zsh#L17-L25
  if gh_bin="$(command_locate gh)" && [[ -n "$gh_bin" ]]; then
    gh_comp_path="${ZSH_CACHE_DIR}/site-functions/_gh"
    if [[ "$gh_bin" -nt "$gh_comp_path" || ! -s "$gh_comp_path" ]]; then
      _perf_timer_start "generate gh completions"
      "$gh_bin" completion -s zsh >| "$gh_comp_path"
      _perf_timer_stop "generate gh completions"
    fi
    unset gh_comp_path
  fi; unset gh_bin

  if bw_bin="$(command_locate bw)" && [[ -n "$bw_bin" ]]; then
    bw_comp_path="${ZSH_CACHE_DIR}/site-functions/_bw"
    if [[ "$bw_bin" -nt "$bw_comp_path" || ! -s "$bw_comp_path" ]]; then
      _perf_timer_start "generate bw completions"
      "$bw_bin" completion --shell zsh >| "$bw_comp_path"
      _perf_timer_stop "generate bw completions"
    fi
    unset bw_comp_path
  fi; unset bw_bin

  _plugin nim-compl 'https://raw.githubusercontent.com/nim-lang/Nim/devel/tools/nim.zsh-completion' from=url \
    after_load='plugin-cfg-path fpath prepend ""'

  _plugin keybase-compl 'https://raw.githubusercontent.com/fnoris/keybase-zsh-completion/master/_keybase' from=url \
    after_load='plugin-cfg-path fpath prepend ""'
# }}}
