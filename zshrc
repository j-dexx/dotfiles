# Check if a command exists
command_exists () {
  type "$1" > /dev/null 2>&1;
}

function git-prune-branches() {
  echo "switching to master or main branch.."
  git branch | grep 'main\|master' | xargs -n 1 git checkout
  echo "fetching with -p option...";
  git fetch -p;
  echo "running pruning of local branches"
  git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D ;
}

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

# Autocompletion
autoload -Uz compinit && compinit

if command_exists op; then
  eval "$(op completion zsh)"; compdef _op op
fi

if command_exists kubectl; then
  source <(kubectl completion zsh)
fi

if command_exists thefuck; then
  eval "$(thefuck --alias)"
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

if [ -d "$HOME/.dotnet/tools" ]; then
  export PATH="$PATH:/$HOME/.dotnet/tools"
fi

if [ -d "/opt/homebrew/bin" ]; then
  export PATH=/opt/homebrew/bin:$PATH
  export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
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

# Podman
#export DOCKER_HOST=unix://$HOME/.local/share/containers/podman/machine/podman.sock

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/james/google-cloud-sdk/path.zsh.inc' ]; then . '/home/james/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/james/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/james/google-cloud-sdk/completion.zsh.inc'; fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(starship init zsh)"

source /Users/james/.config/op/plugins.sh


eval "$(/Users/james/.local/bin/mise activate zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/james/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# pnpm
export PNPM_HOME="/Users/james/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# For react-native
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Add .NET Core SDK tools
export PATH="$PATH:/Users/james/.dotnet/tools"
export PATH="$PATH:/Users/james/code/learning/worldbanc/private/bin"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/.local/opt/go/bin
export PATH=$PATH:$HOME/go/bin

# sentry
fpath=("/Users/james/.local/share/zsh/site-functions" $fpath); if [[ -o interactive ]]; then if ! (( $+functions[compdef] )); then autoload -Uz compinit; compinit; fi; autoload -Uz _sentry; compdef _sentry sentry; fi
