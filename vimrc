set nocompatible

if has('vim_starting')
  if has("win32")
    set rtp+=~/vimfiles/bundle/neobundle.vim/
  else
    set rtp+=~/.vim/bundle/neobundle.vim/
  endif
endif
if has("win32")
  lang C
  call neobundle#rc(expand('~/vimfiles/bundle/'))
else
  set shell=/bin/zsh
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim', {'depends': 'vim-scripts/md5.vim'}
if !has('lua') || v:version < 703 ||
        \ (v:version == 703 && !has('patch885'))
  NeoBundle 'Shougo/neocomplcache.vim'
else
  NeoBundle 'Shougo/neocomplete.vim', {'depends': 'vim-scripts/md5.vim'}
end
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-ssh'

NeoBundle 'vim-scripts/localvimrc'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vim-scripts/greplace.vim'
NeoBundle 'vim-scripts/sudo.vim'

NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-pastie'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-dispatch'

NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/webapi-vim'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/snipmate-snippets'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'skwp/vim-colors-solarized'

NeoBundle 'pydave/gitv'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jezcope/vim-align'
NeoBundle 'groenewege/vim-less'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'leshill/vim-json'
NeoBundle 'tmallen/proj-vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'spiiph/vim-space'
NeoBundle 'chrismetcalf/vim-yankring'
NeoBundle 'emezeske/manpageview'
NeoBundle 'vimoutliner/vimoutliner'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'briangershon/html5.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'nishigori/vim-phpunit-snippets'
NeoBundle 'garbas/vim-snipmate', {'depends': 'MarcWeber/vim-addon-mw-utils'}
"NeoBundle 'tomtom/tlib_vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'techlivezheng/tagbar-phpctags', {
      \ 'build': {
      \   'unix': 'make'
      \ },
      \}
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'wting/gitsessions.vim'
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'
NeoBundle 'tsukkee/unite-tag'
if executable('tmux')
  NeoBundle 'tsaleh/vim-tmux'
endif

NeoBundle 'git@github.com:talmuth/misc-lang-settings.vim.git'
NeoBundle 'git@github.com:talmuth/local-snippets.vim.git'
NeoBundle 'git@github.com:talmuth/php.vim.git'

let s:has_python_powerline=0
if has('python') || has('python3')
  let s:python_ver = 0
  silent! python import sys, vim;
        \ vim.command("let s:python_ver="+"".join(map(str,sys.version_info[0:3])))
  if s:python_ver > 260
    NeoBundle 'dbakker/vim-lint'
    NeoBundle 'vim-scripts/PHPUnit-QF'
    NeoBundle 'git@github.com:talmuth/vim-php-debugger.git'

    silent python <<EOF
import vim
try:
  import powerline.vim
  vim.command("let s:has_python_powerline=1")
except ImportError:
  pass
EOF
  end
end

if s:has_python_powerline == 0
  NeoBundle 'skwp/vim-powerline'
else
  NeoBundle 'baopham/linepower.vim'
endif

filetype on
syntax on
filetype plugin indent on

NeoBundleCheck

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
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

let g:indentLine_char='┆'
let g:indentLine_color_term=236

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
set directory=~/.backup,~/tmp,$TMP

let g:showmarks_enable = 0

" Make
":command -nargs=* Make make <args> | cwindow 3

let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

set enc=utf-8
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

nmap <leader>g :GundoToggle<CR>

" ,sh to open vimshell tab
nmap <Leader>sh :VimShellTab<CR>

let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
" map ,y to show the yankring
nmap <leader>y :YRShow<cr>

if has("mouse")
  set mouse=a
endif

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
"augroup PHPUnitFileType
"  autocmd!
"  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
"augroup END

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)"
 \: "\<TAB>"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:localvimrc_sandbox=0

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :Unite file_rec/async -default-action=tabopen -start-insert<CR>
nnoremap <leader>o :Unite outline -start-insert<CR>

let g:vimfiler_as_default_explorer = 1

if executable('ack-grep') || executable('ack')
  let g:unite_source_grep_command = executable('ack') ? 'ack' : 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <C-F> :UniteWithCursorWord grep:%: -default-action=tabopen -start-insert<CR>

autocmd BufEnter *
  \  if empty(&buftype)
  \|   nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately -default-action=tabopen tag<CR>
  \| endif
