# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="crcandy"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="sorin"
# ZSH_THEME="linuxonly"
# ZSH_THEME="geoffgarside"
# ZSH_THEME="miloshadzic"
ZSH_THEME="mylocal"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# =============
# ===> ABM <===
# =============

fpath+=${ZSH}/.zsh_functions

# Exports
export PATH="${HOME}/.local/bin:/opt/cisco/anyconnect/bin/:${HOME}/bin:${PATH}"
export FZF_DEFAULT_COMMAND='rg --no-ignore --files --hidden --glob "!.git"'
export PYTHONBREAKPOINT="ipdb.set_trace"

# FZF
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Functions
function ppath {
    python -c 'import os; from pprint import pprint; pprint(os.getenv("PYTHONPATH").split(":"))'
}

function pp {
    python -c "from pprint import pprint as pp; pp(${1})"
}

# cd to folder from fzf starting search in ${HOME} dir
# go home
function gh {
    local path
    path=$(fd -L -H -I -t d --base-directory ${HOME} | fzf)
    if [[ ${?} == 0 ]]; then
        print -s "cd ${path}"  # add command to history
        cd ${path}
    fi
}

# Open file from fzf in nvim starting in current dir
# fzf vim current
function fvc {
    local file
    file=$(fzf)
    if [[ ${?} == 0 ]]; then
        print -s "nvim ${file}"  # add command to history
        nvim ${file}
    fi
}

# Open file from fzf in nvim starting in ${HOME} dir
# fzf vim home
function fvh {
    local file
    file=$(rg --no-ignore --files --hidden --glob "!.git" ${HOME} | fzf)
    if [[ ${?} == 0 ]]; then
        print -s "nvim ${file}"  # add command to history
        nvim ${file}
    fi
}

# Aliases
alias lg=lazygit
alias nv=nvim
alias nvnp='nvim --noplugin'
alias files='nohup nautilus . > /dev/null &'

# Bindings
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search
# bindkey '^F' fzf-cd-widget

# Config file where you can put stuff you want to keep local
source ~/.zshrc.ignore
