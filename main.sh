source /etc/zshrc



####  PROMPT CONFIG ####

# /bin/zsh #

autoload -U colors && colors
autoload -Uz vcs_info
precmd () { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}(%b)%{$reset_color%}"
export PS1="%{$fg[magenta]%}%n%{$reset_color%} in %{$fg[green]%}%~%{$reset_color%} \$vcs_info_msg_0_%% "

# /bin/bash #

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# export PS1='\[\033[35m\]\u\[\033[m\] in \[\033[32m\][\w]\[\033[m\]\[\033[33;1m\]\$(parse_git_branch)\[\033[m\]$ '
####  END PROMPT CONFIG ####

alias l='ls -l'
alias reload='source /etc/zshrc ; source ~/.zshrc'

compaudit | sudo xargs chmod g-w
autoload -Uz compinit && compinit
eval "$(_PYMOBILEDEVICE3_COMPLETE=source_zsh pymobiledevice3)"

zstyle :compinstall filename '/Users/ohads/.zshrc'

