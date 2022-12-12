autoload -Uz colors && colors

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='%F{red}%B%(?..[%?]
)%(!.%f%F{red}.%f%F{blue}%(!.%1~.%~)%f%F{white}%B $(git_prompt_info))%b%f
%F{green}%B%_$(prompt_char)%b%f%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
