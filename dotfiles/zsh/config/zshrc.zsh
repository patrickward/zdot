# To run a profiles: `zmodload zsh/zprof`
# To run a test: `for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done`
#
# zshenv -> zprofile -> zshrc -> zlogin
#

# NOTE: SEE zshenv.zsh for all of the sourced files

# Initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit
comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#comp_files )); then
  compinit -i -C
else
  compinit -i
fi

unset comp_files

# Load completion.zsh files after autocomplete loads
for file in ${(M)config_files:#*/*completion.zsh}; do source $file; done

unset config_files

# Load plugin files
find -H "$DOTFILES/zsh/plugins" -maxdepth 1 -name "*.zsh" | while read -r file; do source "$file"; done

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Set prompt
source "$DOTFILES/zsh/config/prompt.zsh"

