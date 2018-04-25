runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

set nocompatible              " be iMproved, required

source /proj/tsp/projects/sapc_CBA/design/environment/vim/runtime/.vimrc
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\\"
let g:mapleader = "\\"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search settings: ack + ag + ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<Leader>c to search, not open first matched file
""""" ack """""
map <Leader>ss :Ack!<Space> 
"search by ag
if executable('ag')
   "let g:ackprg = 'ag --nogroup --nocolor --column'
   let g:ackprg = 'ag --vimgrep'  "report every match on the line
endif
"highlight search key
let g:ackhighlight = 1

"output window height
let g:ack_qhandler = "botright copen 30"
let g:ack_autoclose = 1
"use current word under cursor to search
let g:ack_use_cword_for_empty_search = 1
"accelarate search speed by limit some funtions
"let g:ack_use_dispatch = 1

""""" ctrlp """""
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"search file of current dir
let g:ctrlp_map = '<Leader>sc'
let g:ctrlp_cmd = 'CtrlP'
"search file of MRU
nmap <Leader>sr :CtrlPMRUFiles<CR>
"search file of buffer
nmap <Leader>sb :CtrlPBuffer<CR>
"ignore patten
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"output window size
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_reversed = 0
"MRU max items
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"default search by full path, 1 for file name, promote accuracy rate, could <C-d> to switch
let g:ctrlp_by_filename = 1
"default not search by regex, 1 for default to use regex, could <C-r> to switch
let g:ctrlp_regexp = 0
"prompt
let g:ctrlp_line_prefix = '->'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => filetype settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""" yaml/yml """""""""""
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/ftplugin/yaml.vim
""""""""""" json """"""""""""""
let g:vim_json_syntax_conceal = 0


