# Print TODO contents
cat /home/kunwar/Desktop/TODO.md

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kunwar/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages pip docker)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Alias

alias cpuavail='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_available_governors'
alias cpushow='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cpuhigh='echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias screenon='xrandr --output eDP-1-1 --auto'
alias screenoff='xrandr --output eDP-1-1 --off'

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
export REACT_EDITOR=none
export DENO_INSTALL="/home/kunwar/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

alias vim=nvim
alias dirsize="du -hs * | sort -rh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# For ssh with TERM variable set
alias ssh='TERM=xterm-256color ssh'

# Colors in ip
alias ip='ip -color=auto'

# Cute git log
alias gc="git log --pretty='%C(yellow)%h %C(cyan)%ad %Cgreen%an%C(cyan)%d %Creset%s' --date=relative --date-order --graph --shortstat"

# echo "Hello, World" | clip --> Copy to clipboard
alias clip="xclip -selection clipboard"

# Config alias. More info: https://news.ycombinator.com/item?id=11070797
alias config='git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# Zsh settings for history
HISTORY_IGNORE="(ls|[bf]g|exit|reset|clear|cd|cd ..|cd..)"
HISTSIZE=25000
HISTFILE=~/.zsh_history
SAVEHIST=100000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Add emacs bin to path
export PATH=$PATH:~/.emacs.d/bin

# Add lean to path
export PATH=$PATH:~/.elan/bin

alias todo='cat ~/Desktop/TODO.md'
alias birthdays='ldapsearch -x -H ldap://ldap.iiit.ac.in -b "dc=iiit,dc=ac,dc=in" -s sub "dateOfBirth=*-$(date +'%m-%d')" | tail -n +8 | head -n -7 | grep \#'
