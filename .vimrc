runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

set nocompatible              " be iMproved, required

source /proj/tsp/projects/sapc_CBA/design/environment/vim/runtime/.vimrc
"source ~/.vim/bundle/a/autoload/a.vim
"source ~/.vim/bundle/cd/autoload/cd.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=4

set makeprg=epb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" dark scheme """"""
"set background=dark
"colorscheme molokai
""""" light scheme """"""
"set background=light
"colorscheme peaksea
colorscheme morning

if &diff
   set background=light
   colors peaksea
endif

