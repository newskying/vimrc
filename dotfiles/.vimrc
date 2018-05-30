"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Russell Xing
"       https://github.com/newskying
"
" Version:
"       0.1 - 15/05/18 15:43:36
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors Fonts and Encodings
"    -> Files backups and undo
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Windows tabs and buffers
"    -> Editing mappings
"    -> Vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Bundle Management
"    -> Status line
"    -> Plugin search settings
"    -> Filetype plugin settings
"    -> Coding settings:
"    -> Workspace Customs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrolloff: Set 2 lines to the cursor - when moving vertically using j/k
"set so=2

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*.swp

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Toggle search highlighting
nnoremap <leader>hl :set hlsearch!<CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nostartofline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors Fonts and Encodings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

set t_Co=256
"""""" dark scheme """"""
"set background=dark
"colorscheme molokai
"""""" light scheme """"""
set background=light
"colorscheme peaksea
colorscheme morning

if &diff
   set background=light
   colors peaksea
endif

" Set utf8 as standard encoding and en_US as the standard language
"testline from lightline: separator.left		''		'' (\ue0b0)		'⮀' (\u2b80)
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,default,latin1 "strict to loose
set fileencoding=utf-8 "vim save file using fileencoding
set encoding=utf-8 "vim encoding
let &termencoding=&encoding

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set textwidth=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>e :e %:p:h<cr>:pwd<cr>
cabbr <expr> %% expand('%:p:h')

" Specify the behavior when switching between buffers
"try
  "set switchbuf=useopen,usetab,newtab
  "set stal=2 "showtabline
"catch
"endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
"vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
"map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundle Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
"Helptags "shadowed by fzf.vim


"set autochdir   " not affect ctrlp and fzf for now "using <leader>e instead
"set relativenumber "no use after easymotion.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"lightline with fugitive
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'gitbranch': 'LightlineFugitive',
      \ },
      \ 'separator': { 'left': "⮀", 'right': "⮂" },
      \ 'subseparator': { 'left': "⮁", 'right': "⮃" }
      \ }

	function! LightlineReadonly()
		return &readonly ? "⭤" : ''
	endfunction
	function! LightlineFugitive()
		if exists('*fugitive#head')
			let branch = fugitive#head()
			return branch !=# '' ? "⭠".branch : ''
		endif
		return ''
	endfunction

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %y%w\ \Line:%l/%L\ Col:%c  "use status line plugin instead


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin search settings: ack + ctrlp + fzf + rg|ag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" ack """"""""""
map <Leader>ss :Ack!<Space> 
"search by rg or ag
if executable('rg')
   let g:ackprg = 'rg --vimgrep'  "report every match on the line
elseif executable('ag')
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

"""""""""" ctrlp """"""""""
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"search file of current dir
"let g:ctrlp_map = '<Leader>sc'  "use fzf for alternative
let g:ctrlp_cmd = 'CtrlP'
"search file of MRU
nnoremap <Leader>sr :CtrlPMRUFiles<CR>
"search file of buffer
nnoremap <Leader>sb :CtrlPBuffer<CR>
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
""""""""""" ctrlp-funky """"""""""
"search file of function
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

""""""""""" fzf and fzf.vim """""""""""
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fw :Windows<CR>
nnoremap <Leader>fr :History<CR>
nnoremap <Leader>fhc :History:<CR>
nnoremap <Leader>fhs :History/<CR>
nnoremap <Leader>fm :Marks<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fc :BCommits<CR>
nnoremap <Leader>fg :GFiles?<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""" yaml/yml """""""""""
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/ftplugin/yaml.vim
""""""""""" json """"""""""""""
let g:vim_json_syntax_conceal = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coding settings:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" switch between header/source """"""""""

"""""""""" YCM """"""""""
"let g:ycm_server_python_interpreter='~/local/python/bin/python' "can't find my python???
let g:ycm_global_ycm_extra_conf='~/.vim/dotfiles/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <Leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gy :YcmCompleter GetType<CR>
"""""""""" Tagbar """"""""""
nnoremap <F9> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Workspace Customs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set autoindent
set softtabstop=3
set tabstop=3
set shiftwidth=3
set expandtab
set tags=$AD_SW_DIR/tags
nnoremap <F8> :!ctags -f  $AD_SW_DIR/tags -R --c++-kinds=+p --fields=+iaS --extra=+q $AD_SW_DIR/ft/bat/lib2 $AD_SW_DIR/ft/bat/tss_04_SACC40 $AD_SW_DIR/Epc_SA/ $AD_SW_CBA_DIR/Code/ $AD_SW_DIR/st/bat/bat_LoadTraffic/trafficCases/ $AD_SW_DIR/st/lib/<CR>
" Remove Trailing Whitespace
"nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
au FileType xml exe ":silent 1,$!xmllint --format --recover -"
au BufNewFile,BufRead buildfile set filetype=ruby
au BufRead,BufNewFile *.ttcn set filetype=ttcn
au! Syntax ttcn source $ENVIRONMENT/vim/runtime/syntax/ttcn.vim
au BufRead,BufNewFile *.thrift set filetype=thrift
au! Syntax thrift source $ENVIRONMENT/vim/runtime/syntax/thrift.vim
set makeprg=epb
nnoremap <F3> :!cp $GS/software/build/development-with-optimizations/compile_commands.json $GS/software/build/<CR>

" support c++11 bracket initialization
let c_no_curly_error = 1

"""""""""" IndentLines """"""""""
map <leader>il :IndentLinesToggle<CR>
"""""""""" easy-align """"""""""
xmap <leader>ga <Plug>(EasyAlign)
nmap <leader>ga <Plug>(EasyAlign)

