# Autocompletion
autoload -Uz compinit
compinit

source <(kubectl completion zsh)

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    echoti smkx
  }
  function zle-line-finish () {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Check if a command exists
command_exists () {
  type "$1" > /dev/null 2>&1;
}

if command_exists thefuck; then
  eval "$(thefuck --alias)"
fi

if [ -d "$HOME/.asdf" ]; then
  source $HOME/.asdf/asdf.sh
  source $HOME/.asdf/completions/asdf.bash
fi

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.config/composer" ]; then
  export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

if [ -d "$HOME/.yarn/bin" ]; then
  export PATH="$HOME/.yarn/bin:$PATH"
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

source <(antibody init)

# Use pure
antibody bundle mafredri/zsh-async
# antibody bundle sindresorhus/pure
antibody bundle paulirish/git-open
antibody bundle denysdovhan/spaceship-prompt

# Syntax highlighting bundle.
antibody bundle zsh-users/zsh-syntax-highlighting

# https://github.com/sindresorhus/pure/issues/276
setopt prompt_subst

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/james/google-cloud-sdk/path.zsh.inc' ]; then . '/home/james/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/james/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/james/google-cloud-sdk/completion.zsh.inc'; fi
