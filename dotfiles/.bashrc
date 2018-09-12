#add local bin
export PATH="$PATH:$HOME/local/vim/bin"

#import fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#1[find] vs. 2[ag] vs. 3[rg]
#export FZF_DEFAULT_COMMAND='find .'
#export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore --no-messages'
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git}/*" 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_CTRL_T_COMMAND="rg --files --follow 2>/dev/null"
#export FZF_DEFAULT_OPTS


#import fasd
#eval "$(fasd --init auto)"

#import python
[ -f ~/.python.bash ] && source ~/.python.bash

alias vim=$HOME/local/vim/bin/vim
alias vimdiff=$HOME/local/vim/bin/vimdiff
alias xxd=$HOME/local/vim/bin/xxd

#import clang
export PATH="$PATH:$HOME/local/llvm/clang+llvm-6.0.0-x86_64-linux-sles12.2/bin"

#term setting
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
     export TERM='xterm-256color'
else
     export TERM='xterm-color'
fi


