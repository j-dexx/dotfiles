export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export TERM=xterm-256color

# Base16 Shell
# https://github.com/chriskempson/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
