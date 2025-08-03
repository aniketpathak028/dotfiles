# ~/.bashrc

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# set to superior editing mode
set -o vi

# keybindings
bind -x '"\C-l":clear'

# --- Git Prompt Configuration ---
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"

# Path to git-prompt.sh
GIT_PROMPT_SCRIPT="/Users/aniket/.oh-my-zsh/plugins/gitfast/git-prompt.sh"

if [ -f "$GIT_PROMPT_SCRIPT" ]; then
    source "$GIT_PROMPT_SCRIPT"
    # Configure PROMPT_COMMAND to include Git status
    # \u   - Username
    # \W   - Basename of current working directory
    # __git_ps1 " (%s)" - Git branch info (e.g., " (main *)")
    # \$   - Prompt symbol ($ or #)

    # Colors:
    # \e[33m - Yellow for username
    # \e[32m - Green for the current directory
    # \e[0m  - Reset color

    # Format: username:current_dir (git_branch)$
    PROMPT_COMMAND='__git_ps1 "\[\e[33m\]\u\[\e[0m\]:\[\e[32m\]\W\[\e[0m\]$(__git_ps1 " (%s)")\$ "'
else
    # Fallback prompt if git-prompt.sh or __git_ps1 is not available
    PROMPT_COMMAND='\u: \W\$ '
fi
