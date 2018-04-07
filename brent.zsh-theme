autoload -Uz colors && colors

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

PROMPT='$FG[210]%(?..[%?]
)%(!.%{$fg_bold[red]%}.%{$fg_bold[blue]%}%(!.%1~.%~)$FG[250] $(git_prompt_info))
$FG[106]%_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
