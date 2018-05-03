# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ezxinxi/.vim/bundle/fzf/bin* ]]; then
  export PATH="$PATH:/home/ezxinxi/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ezxinxi/.vim/bundle/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ezxinxi/.vim/bundle/fzf/shell/key-bindings.bash"

