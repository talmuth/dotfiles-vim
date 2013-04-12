set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


Bundle 'vim-scripts/TinyBufferExplorer'
Bundle 'vim-scripts/localvimrc'
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/DrillCtg'
Bundle 'vim-scripts/Risto-Color-Scheme'
Bundle 'vim-scripts/ShowMarks'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/md5.vim'
Bundle 'vim-scripts/PHPUnit-QF'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-pastie'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-dispatch'

Bundle 'mattn/gist-vim'
Bundle 'mattn/zencoding-vim'
Bundle 'mattn/webapi-vim'

Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'scrooloose/nerdcommenter'

Bundle 'skwp/vim-colors-solarized'
Bundle 'skwp/vim-powerline'

Bundle 'pydave/gitv'
Bundle 'plasticboy/vim-markdown'
Bundle 'sjl/gundo.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'godlygeek/tabular'
Bundle 'jezcope/vim-align'
Bundle 'Townk/vim-autoclose'
Bundle 'groenewege/vim-less'
Bundle 'ervandew/supertab'
Bundle 'guns/xterm-color-table.vim'
Bundle 'leshill/vim-json'
Bundle 'tmallen/proj-vim'
Bundle 'rodjek/vim-puppet'
Bundle 'spiiph/vim-space'
Bundle 'tsaleh/vim-tmux'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'clones/vim-l9'
Bundle 'emezeske/manpageview'
Bundle 'vimoutliner/vimoutliner'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/neocomplcache'
Bundle 'skammer/vim-css-color'
Bundle 'briangershon/html5.vim'
Bundle 'shawncplus/php.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'myusuf3/numbers.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'chilicuil/conque'
Bundle 'tobyS/pdv'
Bundle 'nishigori/vim-phpunit-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'slim-template/vim-slim'
Bundle 'techlivezheng/tagbar-phpctags'

Bundle 'git@github.com:talmuth/misc-lang-settings.vim.git'
Bundle 'git@github.com:talmuth/local-snippets.vim.git'
Bundle 'git@github.com:talmuth/vim-php-debugger.git'

filetype on
syntax on
filetype plugin indent on

"set completeopt=menuone,preview,longest
set completeopt=menuone,preview
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Omni completion settings
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1
" completing Rails hangs a lot
"let g:rubycomplete_rails = 1

" syntastic
let g:syntastic_enable_signs=1

set background=dark
colorscheme solarized
let g:solarized_termcolors=256
"let g:solarized_termcolors=16
let g:solarized_visibility="high"
"let g:solarized_contrast="high"
let g:solarized_termtrans=1

let bash_is_sh=1
set cinoptions=:0,(s,u0,U1,g0,t0

set modelines=5

set laststatus=2

function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

"set cuc
"set cul

set number
set textwidth=0         " Do not wrap words (insert)
set nowrap              " Do not wrap words (view)
set showcmd             " Show (partial) commsand in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS
set incsearch           " Incremental search
set autowriteall        " Automatically save before commands like :next and :make
set hlsearch            " Highlight search match
set hidden              " enable multiple modified buffers
set nobackup            " do not write backup files
set foldcolumn=0        " columns for folding
set foldmethod=indent
set foldlevel=9
set history=1000
set wildmenu
set ruler
set visualbell
set ts=4
set sw=4
set eol
set binary
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set backspace=indent,eol,start

"highlight lCursor guifg=NONE guibg=Cyan
"highlight link ShowMarksHLl LineNr
"highlight link ShowMarksHLu LineNr
"highlight link ShowMarksHLo LineNr
"highlight link ShowMarksHLm LineNr
highlight SignColumn ctermfg=239 ctermbg=235 guifg=Yellow

setlocal spelllang=en_us

"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

set backupdir=~/.backup
set directory=~/.backup,~/tmp

let g:showmarks_enable = 0

" Make
":command -nargs=* Make make <args> | cwindow 3

let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" highlight trailing whitespace  
set listchars=tab:»·,trail:·,nbsp:·,nbsp:×,extends:›,precedes:‹
nmap <silent> <leader>s :set nolist!<CR>

" extended '%' mapping for if/then/else/end etc
runtime macros/matchit.vim

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Ctrl-N to disable search match highlight
nmap <silent> <C-N> :silent noh<CR>

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

let g:NERDTreeDirArrows=0
" Ctrl-P to Display the file browser tree
nmap <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>


" ,t to show tags window
"let Tlist_Show_Menu=1
nmap <leader>t :TagbarToggle<CR>
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-Left> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"

nmap <leader>g :GundoToggle<CR>


" ,f to fast finding files using fuzzy finder.
nmap <leader>f :FufFile **/<CR>
nmap <leader>b :FufBuffer *<CR>


let g:Conque_Read_Timeout = 50 " timeout for waiting for command output.
let g:Conque_TERM = 'xterm'
" ,sh to open vimshell window
nmap <Leader>sh :ConqueTermSplit bash<CR>
" ,r to open vimshell window
nmap <Leader>r :ConqueTermSplit 


let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" map ,y to show the yankring
nmap <leader>y :YRShow<cr>

if has("mouse")
  set mouse=a
endif

set shell=/bin/zsh

set winheight=80

let g:debuggerMaxDepth = 10

let g:snips_author = 'Denys Lozko <denis.lozko@gmail.com>' 

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.py,*.js,*.php,*.css,*.rb,*.yaml,*.scss :call <SID>StripTrailingWhitespaces()

let g:manpageview_multimanpage=0

let g:localvimrc_ask=0

let g:Powerline_symbols='fancy'
let g:tagbar_phpctags_bin='~/.vim/bundle/misc-lang-settings.vim/phpctags/phpctags'

let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-n>"
let g:SuperTabNoCompleteAfter=[',', '\s', "'", '"', '=', '>', '<', '-', '+', ':', '|', '/', '\', ';', '*']

imap <Esc>[A <Up>
imap <Esc>[B <Down>
imap <Esc>[C <Right>
imap <Esc>[D <Left>

if &term =~ "xterm" || &term =~ "screen"
  "256 color --
  let &t_Co=256
  " restore screen after quitting
  " set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

highlight IndentGuidesEven ctermbg=236
highlight IndentGuidesOdd ctermbg=235

au! BufRead,BufNewFile,BufWinEnter *.zsh-theme setfiletype zsh.zshtheme

