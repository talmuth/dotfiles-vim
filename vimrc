setglobal nocompatible
setglobal pastetoggle=<F2>

if !filereadable(expand('~/.vim/autoload/plug.vim'))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

let g:private = {
      \ 'in_tmux': 0
      \}

if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:private.in_tmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

setglobal smartcase
setglobal termguicolors
setglobal incsearch
setglobal tags=./tags;
setglobal include=
setglobal path=.,,

filetype on
syntax on
filetype plugin indent on

setglobal complete=.,w,b,u,t
setglobal completeopt=menuone,preview

setglobal number
setglobal showcmd             " Show (partial) commsand in status line.
setglobal showmatch           " Show matching brackets.
setglobal ignorecase          " Do case insensitive matching
setglobal showtabline=2

setglobal ignorecase          " Do case insensitive matching
setglobal smartcase           " do not ignore if search pattern has CAPS
setglobal incsearch           " Incremental search
setglobal autowriteall        " Automatically save before commands like :next and :make
setglobal hlsearch            " Highlight search match
setglobal hidden              " enable multiple modified buffers
setglobal foldcolumn=0        " columns for folding
setglobal foldmethod=marker
setglobal foldlevel=9
setglobal history=1000
setglobal ruler
setglobal visualbell
setglobal binary
setglobal keymap=russian-jcukenwin
setglobal iminsert=0
setglobal imsearch=0
setglobal backspace=indent,eol,start
setglobal cinoptions=:0,(s,u0,U1,g0,t0
setglobal modelines=5
setglobal laststatus=2
setglobal enc=utf-8
" highlight trailing whitespace  
setglobal listchars=tab:»·,trail:·,nbsp:·,nbsp:×,extends:›,precedes:‹
setglobal showbreak=↪

setglobal backupdir=~/.backup//
setglobal undodir=~/.undo//
setglobal backupskip=/tmp/*
setglobal directory=~/.backup//
setglobal noswapfile

" Make those folders automatically if they don't already exist. {{{
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
" }}}

let g:mapleader="\<space>"

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" plug#begin {{{
call plug#begin('~/.local/share/vim/plugins')
Plug 'chriskempson/base16-vim'

Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'dawikur/base16-vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb', { 'on': 'GBrowse' }
Plug 'tommcdo/vim-fubitive', { 'on': 'GBrowse' }
Plug 'macthecadillac/lightline-gitdiff'

Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter', { 'on': 'NERDComment' }

Plug 'ryanoasis/vim-devicons'

Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'on': 'Files' }
Plug 'junegunn/fzf.vim', { 'on': 'Files' } 

Plug 'majutsushi/tagbar'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'Shougo/context_filetype.vim'

Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

if executable('rndc')
  Plug 'Absolight/vim-bind'
endif
call plug#end()
" }}}

colorscheme base16-monokai

" lightline {{{
let g:lightline = {
        \   'active': {
        \     'left': [ [ 'mode', 'paste' ],
        \              [ 'gitbranch', 'gitstatus', 'readonly', 'filename', 'modified' ]
        \     ],
        \     'right': [ [ 'lineinfo' ],
        \            [ 'percent' ],
        \            [ 'fileformat', 'fileencoding', 'filetype' ],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
        \     ],
        \   },
        \   'component': {
        \     'lineinfo': ' %3l:%-2v',
        \     'gitstatus': '%<%{lightline_gitdiff#get_status()}'
        \   },
        \   'component_function': {
        \     'gitbranch': 'fugitive#head',
        \   },
        \   'tabline': {
        \     'left': [ ['buffers'] ],
        \     'right': [ ['close'] ]
        \   },
        \   'component_expand': {
        \     'buffers': 'lightline#bufferline#buffers',
        \     'linter_checking': 'lightline#ale#checking',
        \     'linter_infos': 'lightline#ale#infos',
        \     'linter_warnings': 'lightline#ale#warnings',
        \     'linter_errors': 'lightline#ale#errors',
        \     'linter_ok': 'lightline#ale#ok',
        \   },
        \   'component_type': {
        \     'buffers': 'tabsel',
        \     'linter_checking': 'right',
        \     'linter_infos': 'right',
        \     'linter_warnings': 'warning',
        \     'linter_errors': 'error',
        \     'linter_ok': 'right',
        \   },
        \   'component_visible_condition': {
        \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
        \   },
        \ }

let g:lightline.separator = {
        \   'left': '', 'right': ''
        \}

let g:lightline.subseparator = {
        \   'left': '', 'right': '' 
        \}

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#composed_number_map = {
        \ 1:  '⑴ ', 2:  '⑵ ', 3:  '⑶ ', 4:  '⑷ ', 5:  '⑸ ',
        \ 6:  '⑹ ', 7:  '⑺ ', 8:  '⑻ ', 9:  '⑼ ', 10: '⑽ ',
        \ 11: '⑾ ', 12: '⑿ ', 13: '⒀ ', 14: '⒁ ', 15: '⒂ ',
        \ 16: '⒃ ', 17: '⒄ ', 18: '⒅ ', 19: '⒆ ', 20: '⒇ '}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
" }}}
"{{{tmuxline.vim
if g:private.in_tmux == 1
  let g:tmuxline_preset = {
        \ 'a'       : '#S',
        \ 'b'       : '%R',
        \ 'c'       : [ '#{sysstat_mem} #{upload_speed}' ],
        \ 'win'     : [ '#I', '#W' ],
        \ 'cwin'    : [ '#I', '#W', '#F' ],
        \ 'x'       : [ '#{download_speed} #{sysstat_cpu}',
        \               '#{battery_status_bg}#{battery_icon} #{battery_percentage} #{battery_remain}' ],
        \ 'y'       : [ '%Y-%m-%d' ],
        \ 'z'       : [ '#h #{prefix_highlight}' ],
        \ 'options' : { 'status-justify': 'left', 'window-status-activity-style': 'none' }
        \}
endif
"}}}

" ALE {{{
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
" }}}

" NERDTree {{{
" Display the file browser tree
nmap <silent> <C-P> :NERDTreeToggle<CR>
" Show current file in the tree
nmap <silent> <leader>p :NERDTreeFind<CR>
" }}}

" NERDComment {{{
" Invert comment on the current line/selection
nmap <silent> <leader>/ :call NERDComment(0, "invert")<cr>
vmap <silent> <leader>/ :call NERDComment(0, "invert")<cr>
" }}}

" Editorconfig {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}

" FZF {{{
map <silent>; :Files<CR>
" }}}

" mattn/vim-gist {{{
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1
" }}}

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
au!
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup END
