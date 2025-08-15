# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ powerlevel10k instant prompt configuration ~~~~~~~~~~~~~~~~~~~~~
# Should stay close to the top of ~/.zshrc. Initialization code that may require
# console input must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~
setopt extended_glob null_glob

path=(
    $path
    "/usr/local/bin"
    "/opt/homebrew/bin"
    "$HOME/.local/bin"
    "$HOME/.npm-global/bin"
    "$HOME/bin"
)

# remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))
export PATH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Alacritty Path Configuration
# check if running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Set ALACRITTY_CONFIG_PATH to point to the directory containing your mac.toml
  export ALACRITTY_CONFIG_PATH="$HOME/dotfiles/alacritty/.config/alacritty/"
  # Then, create the symlink for Alacritty to find the correct config file.
  # Ensure the target directory exists first.
  mkdir -p ~/.config/alacritty/
  ln -sf ~/dotfiles/alacritty/.config/alacritty/mac.toml ~/.config/alacritty/alacritty.toml
fi

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# ---- Eza (better ls) -----

alias ls="eza --icons=always"

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# plugins
plugins=(git)

# Initialize Oh My Zsh
source $ZSH/oh-my-zsh.sh

# --- User configuration ---

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias mkcd='() { mkdir -p "$1" && cd "$1"; }' # Create a dir and cd into it
alias cls='clear'
alias v='nvim'

# List aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias gs='git status'
alias gc='git commit -m'       # Commit with a message
alias gca='git commit -am'     # Add all changes and commit with a message
alias ga='git add'             # Add specific files
alias gaa='git add .'          # Add all current directory changes
alias gp='git push'            # Push to remote
alias gpl='git pull'           # Pull from remote
alias gl='git log --oneline --decorate --graph --all' # Concise, visual log
alias gb='git branch'          # List branches
alias gco='git checkout'       # Checkout branch/commit
alias gst='git stash'          # Stash changes
alias gcount='git rev-list --count HEAD' # Count commits
alias glog='git log --graph --pretty=format:"%C(bold blue)%h%C(reset) %C(bold green)%ad%C(reset) %C(bold yellow)%d%C(reset) %s %C(dim white)- %an%C(reset)" --adj --date=short' # Detailed log

# Config file aliases
alias zshrc='nvim ~/.zshrc'
alias rzshrc= 'source ~/.zshrc'
alias p10k='nvim ~/.p10k.zsh'
alias alac='nvim ~/.config/alacritty/alacritty.toml'
alias tx='nvim ~/.tmux.conf'
alias vc='nvim ~/.config/nvim/init.lua'
alias vcon='cd ~/.config/nvim/'
alias dot='cd ~/dotfiles'
alias dsa='cd ~/workspace/dsa/'
alias portfolio='cd ~/workspace/projects/portfolio/'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
