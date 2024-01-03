# Check if a command exists
command_exists () {
  type "$1" > /dev/null 2>&1;
}

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

# Autocompletion
autoload -Uz compinit && compinit

if command_exists kubectl; then
  source <(kubectl completion zsh)
fi

if command_exists thefuck; then
  eval "$(thefuck --alias)"
fi

if [ -d "$HOME/.asdf" ]; then
  source $HOME/.asdf/asdf.sh
  # append completions to fpath
  fpath=(${ASDF_DIR}/completions $fpath)
fi

if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.config/composer" ]; then
  export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
if [ -d "$HOME/.composer" ]; then
  export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

if [ -d "$HOME/library/Python/3.9/bin" ]; then
  export PATH="$HOME/Library/Python/3.9/bin:$PATH"
fi

if [ -d "/opt/homebrew/bin" ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

export PATH=$HOME/bin:$PATH
export XDEBUG_CONFIG="idekey=VSCODE"

export TERM=xterm-256color

# Allow cd to look in these directories
setopt auto_cd
cdpath=($HOME/code $HOME)

if [ -d "$HOME/code/php" ]; then
  cdpath+="$HOME/code/php"
fi

if [ -d "$HOME/code/ruby" ]; then
  cdpath+="$HOME/code/ruby"
fi

if [ -d "$HOME/code/js" ]; then
  cdpath+="$HOME/code/js"
fi

if [ -d "$HOME/code/c-sharp" ]; then
  cdpath+="$HOME/code/c-sharp"
fi

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/james/google-cloud-sdk/path.zsh.inc' ]; then . '/home/james/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/james/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/james/google-cloud-sdk/completion.zsh.inc'; fi


eval "$(starship init zsh)"

