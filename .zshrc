# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/workspace/git-tools/:/snap/bin:$HOME/bin/:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="nebirhos"
#ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
###########
# Plugins #
###########

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Manage plugins with Antigen

# Get antigen
# curl -L git.io/antigen > $HOME/.antigen.zsh

# Load Antigen
source $HOME/.antigen.zsh

# Load Antigen configurations
antigen init $HOME/.antigenrc

#plugins=(
    #git
    #zsh-syntax-highlighting
    #zsh-autosuggestions
    #autojump
#)

source $ZSH/oh-my-zsh.sh

#######################
# zsh-autosuggestions #
#######################

bindkey '^ ' autosuggest-accept

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

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

alias mux='tmuxinator'
alias go='gnome-open'
#alias custdmd='~/workspace/dlang/code/dmd/generated/linux/release/64/dmd -I~/workspace/dlang/code/druntime/import/ -I~/workspace/dlang/code/phobos -L-L$HOME/workspace/dlang/code/phobos/generated/linux/release/64/'
alias alexcustdmd='~/workspace/dlang/code/dmd/src/dmd -I~/workspace/dlang/alex/druntime/import/ -I~/workspace/dlang/alex/phobos -L-L$HOME/workspace/dlang/alex/phobos/generated/linux/release/64/'
alias dotcfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

custdmd2() {
    ~/workspace/dlang/code/dmd/generated/linux/release/64/dmd -I~/workspace/dlang/code/druntime/import/ -I~/workspace/dlang/code/phobos -L-L$HOME/workspace/dlang/code/phobos/generated/linux/release/64/ "$@"
}
export custdmd2

# dlang env var for wine windows build
export DM_HOME=C:\\D
export HOST_DC=dmd

# D make shortcuts
alias _pmake='make -j8 -f posix.mak BUILD=release'
function ptmake () {
    for i in $*; do
        test_name=$(echo "$i" | sed -e 's/\.d$/\.test/')
        _pmake $test_name
    done
}

alias _pdmake='make -j8 -f posix.mak BUILD=debug'
function pdtmake () {
    for i in $*; do
        test_name=$(echo "$i" | sed -e 's/\.d$/\.test/')
        _pdmake $test_name
    done
}

alias reverse_fep='ssh -l cstaniloiu fep.grid.pub.ro -R 6970:localhost:22'

# added by travis gem
[ -f /home/ubuntu/.travis/travis.sh ] && source /home/ubuntu/.travis/travis.sh

# TMATE Functions

TMATE_PAIR_NAME="$(whoami)-pair"
TMATE_SOCKET_LOCATION="/tmp/tmate-pair.sock"

# Get current tmate connection url
tmate-url() {
  url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
  echo "$url" | tr -d '\n' | pbcopy
  echo "Copied tmate url for $TMATE_PAIR_NAME:"
  echo "$url"
}

# Start a new tmate pair session if one doesn't already exist
# If creating a new session, the first argument can be an existing TMUX session to connect to automatically
tmate-pair() {
  if [ ! -e "$TMATE_SOCKET_LOCATION" ]; then
    tmate -S "$TMATE_SOCKET_LOCATION" -f "$HOME/.tmate.conf" new-session -d -s "$TMATE_PAIR_NAME"
    sleep 0.3
    tmate-url
    sleep 1

    if [ -n "$1" ]; then
      tmate -S "$TMATE_SOCKET_LOCATION" send -t "$TMATE_PAIR_NAME" "TMUX='' tmux attach-session -t $1" ENTER
    fi
  fi
  tmate -S "$TMATE_SOCKET_LOCATION" attach-session -t "$TMATE_PAIR_NAME"
}

# Close the pair because security
tmate-unpair() {
  if [ -e "$TMATE_SOCKET_LOCATION" ]; then
    tmate -S "$TMATE_SOCKET_LOCATION" kill-session -t "$TMATE_PAIR_NAME"
    echo "Killed session $TMATE_PAIR_NAME"
  else
    echo "Session already killed"
  fi
}

# End TMATE Functions

source ~/dlang/ldc-1.20.1/activate
eval $(dircolors ~/.dircolors)
