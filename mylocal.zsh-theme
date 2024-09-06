ZSH_THEME_GIT_PROMPT_PREFIX="%F{214}(%f%F{216}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%F{214})%f "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{218}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

24h_time() {
  echo '%F{247}[%*]%f'
}

curr_dir() {
  echo '%F{117}%1~%f'
}

prompt_char() {
  echo '%F{218}%(!.#.$)%f'
}

PROMPT='$(24h_time) $(curr_dir) $(git_prompt_info)$(prompt_char) '
