" Neobundle {{{
" Init {{{2
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
  if executable('/usr/local/bin/zsh')
    set shell=/usr/local/bin/zsh
  elseif executable('/bin/zsh')
    set shell=/bin/zsh
  endif
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles {{{2
" By Shougo {{{3
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
if !has('lua') || v:version < 703 ||
        \ (v:version == 703 && !has('patch885'))
  NeoBundle 'Shougo/neocomplcache.vim'
else
  NeoBundle 'Shougo/neocomplete.vim', {'depends': 'vim-scripts/md5.vim'}
end
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Shougo/vimshell.vim'
" Unite {{{4
NeoBundle 'Shougo/unite.vim', {'depends': 'vim-scripts/md5.vim'}
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/unite-help'
"NeoBundle 'tsukkee/unite-tag'
NeoBundle 'todesking/unite-tag', {'depends': 'Shougo/unite.vim'}
NeoBundle 'osyo-manga/unite-quickfix', {'depends': 'Shougo/unite.vim'}

" }}}4
NeoBundle 'Shougo/vimfiler.vim', {'depends': 'Shougo/unite.vim'}

" By vim-scripts {{{3
NeoBundle 'vim-scripts/localvimrc'
NeoBundle 'vim-scripts/vimwiki'
NeoBundle 'vim-scripts/ShowMarks'
NeoBundle 'vim-scripts/greplace.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/Tail-Bundle'
NeoBundle 'vim-scripts/YankRing.vim'

NeoBundle 'vim-ruby/vim-ruby'

" By Tim Pope {{{3
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

" By mattn {{{3
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'

" By scrooloose {{{3
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'

" By other random good guys {{{3
NeoBundle 'pydave/gitv'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jezcope/vim-align'
NeoBundle 'groenewege/vim-less'
NeoBundle 'guns/xterm-color-table.vim'
NeoBundle 'leshill/vim-json'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'spiiph/vim-space'
NeoBundle 'emezeske/manpageview'
NeoBundle 'vimoutliner/vimoutliner'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'othree/html5.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'wlue/thrift.vim'
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
" TMUX related {{{4
if executable('tmux')
  NeoBundle 'tsaleh/vim-tmux'
  NeoBundle 'benmills/vimux'
  NeoBundle 'skalnik/vim-vroom'
endif

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'joom/latex-unicoder.vim'
NeoBundle 'christoomey/vim-tmux-navigator'

" By me {{{3
NeoBundle 'git@github.com:talmuth/misc-lang-settings.vim.git'
NeoBundle 'git@github.com:talmuth/php-balloon.vim.git'

" Snippets {{{3
"NeoBundle 'Shougo/neosnippet.vim', {'disabled': !has('lua')}

"NeoBundle 'scrooloose/snipmate-snippets'
"NeoBundle 'nishigori/vim-phpunit-snippets'
"NeoBundle 'garbas/vim-snipmate', {'depends': 'MarcWeber/vim-addon-mw-utils'}
"NeoBundle 'git@github.com:talmuth/local-snippets.vim.git'


if neobundle#is_sourced('neosnippet.vim')
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: "\<TAB>"
endif

NeoBundle 'SirVer/ultisnips', {'disabled': !has('python')}
NeoBundle 'honza/vim-snippets', {'depends': 'SirVer/ultisnips'}

if neobundle#is_sourced('ultisnips')
  " For snippet_complete marker.
  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
endif

" Python dependent {{{3
let s:has_python_powerline=0
if has('python') || has('python3')
  let s:python_ver = 0
  silent! python import sys, vim;
        \ vim.command("let s:python_ver="+"".join(map(str,sys.version_info[0:3])))
  if s:python_ver > 260
    NeoBundle 'dbakker/vim-lint'
    NeoBundle 'vim-scripts/PHPUnit-QF'
    NeoBundle 'joonty/vdebug'

    " Powerline check {{{4
    silent python <<EOF
import vim
try:
  import powerline.vim
  vim.command("let s:has_python_powerline=1")
except ImportError:
  pass
EOF
    " }}}4
  end
end

" Powerline {{{3
if s:has_python_powerline == 0
  NeoBundle 'skwp/vim-powerline'
else
  NeoBundle 'baopham/linepower.vim'
endif
NeoBundle 'skwp/vim-colors-solarized'

" Snippets {{{3
"NeoBundle 'Shougo/neosnippet.vim', {'disabled': !has('lua')}

"NeoBundle 'scrooloose/snipmate-snippets'
"NeoBundle 'nishigori/vim-phpunit-snippets'
"NeoBundle 'garbas/vim-snipmate', {'depends': 'MarcWeber/vim-addon-mw-utils'}
"NeoBundle 'git@github.com:talmuth/local-snippets.vim.git'

if neobundle#is_sourced('neosnippet.vim')
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: "\<TAB>"
endif

NeoBundle 'SirVer/ultisnips', {'disabled': !has('python')}
NeoBundle 'honza/vim-snippets', {'depends': 'SirVer/ultisnips'}

if neobundle#is_sourced('ultisnips')
  " For snippet_complete marker.
  " Trigger configuration. Do not use <tab> if you use
  " https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  if neobundle#is_sourced('vim-snippets')
    let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
  endif
endif

" Basic options {{{1
filetype on
syntax on
filetype plugin indent on

set complete=.,w,b,u,t
set completeopt=menuone,preview

set number
set showcmd             " Show (partial) commsand in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS
set incsearch           " Incremental search
set autowriteall        " Automatically save before commands like :next and :make
set hlsearch            " Highlight search match
set hidden              " enable multiple modified buffers
set foldcolumn=0        " columns for folding
set foldmethod=marker
set foldlevel=9
set history=1000
set ruler
set visualbell
set binary
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set backspace=indent,eol,start
set cinoptions=:0,(s,u0,U1,g0,t0
set modelines=5
set laststatus=2
set enc=utf-8
" highlight trailing whitespace  
set listchars=tab:»·,trail:·,nbsp:·,nbsp:×,extends:›,precedes:‹
set showbreak=↪

" Backup {{{2
set backupdir=~/.backup//
set undodir=~/.undo//
set backupskip=/tmp/*
set directory=~/.backup//
set noswapfile

" Make those folders automatically if they don't already exist. {{{3
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}2
" Wildmenu completion {{{2
set wildmenu
set wildmode=longest,full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" }}}2
" Line Return {{{2
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Tabs/spaces/line-ends {{{2
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=120
set formatoptions=qrn1j
set colorcolumn=+1
" }}}

if has("mouse")
  set mouse=a
endif

if has('conceal')
  set conceallevel=2
  set concealcursor=i
endif

setlocal spelllang=en_us

" Extended configuration {{{1
let g:bash_is_sh=1

let g:mapleader="\<space>"

" Keymapings {{{2
" Don't use Ex mode, use Q for formatting
map Q gq

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
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

imap <Esc>[A <Up>
imap <Esc>[B <Down>
imap <Esc>[C <Right>
imap <Esc>[D <Left>

" StripTrailingWhitespaces {{{2
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

" Terminal settings {{{2
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
endif " }}}2
" autogroups {{{2
au! BufRead,BufNewFile,BufWinEnter *.zsh-theme setfiletype zsh.zshtheme

"augroup PHPUnitFileType
"  autocmd!
"  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.phpunit
"augroup END

" Show info about item under cursor {{{2
" usable for filetype/colorsheme debugging
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Plugins configuration {{{1
" Unite {{{2
if neobundle#is_sourced('unite.vim')
  let g:unite_prompt = "〉"
  let g:unite_cursor_line_highlight = 'CursorLine'

  call unite#filters#matcher_default#use(['matcher_fuzzy'])

  nmap <leader>f :<C-u>Unite file_rec/async -default-action=tabopen -start-insert<CR>
  nmap <leader>o :<C-u>Unite outline -start-insert<CR>
  nmap <leader>s :<C-u>Unite -quick-match buffer<CR>
  autocmd BufEnter *
    \  if empty(&buftype)
    \|   nmap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately -default-action=tabopen tag<CR>
    \| endif

  " ag configuration {{{5
  if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
      \ '--line-numbers --nocolor --nogroup --hidden --ignore ''hg'' '.
      \ '--ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore ''*fixture*'' '
    let g:unite_source_grep_recursive_opt = ''
  elseif executable('ack-grep') || executable('ack')
    let g:unite_source_grep_command = executable('ack') ? 'ack' : 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    let g:unite_source_grep_recursive_opt = ''
  endif
  nmap <C-F> :UniteWithCursorWord grep:. -default-action=tabopen<CR>
  " }}}5
endif
" ShowMarks {{{2
if neobundle#is_sourced('ShowMarks')
  "highlight lCursor guifg=NONE guibg=Cyan
  "highlight link ShowMarksHLl LineNr
  "highlight link ShowMarksHLu LineNr
  "highlight link ShowMarksHLo LineNr
  "highlight link ShowMarksHLm LineNr
  highlight SignColumn ctermfg=239 ctermbg=235 guifg=Yellow

  let g:showmarks_enable = 0

  nmap <leader>sm :ShowMarksToggle<CR>
endif

" NERDTree {{{2
if neobundle#is_sourced('nerdtree')
  " Ctrl-P to Display the file browser tree
  nmap <C-P> :NERDTreeToggle<CR>
  " ,p to show current file in the tree
  nmap <leader>p :NERDTreeFind<CR>

  let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                      \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                      \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                      \ '.*\.midi$', 'fixtures/**/*.php']
endif

" NERDCommenter {{{2
if neobundle#is_sourced('nerdcommenter')
  " ,/ to invert comment on the current line/selection
  nmap <leader>/ :call NERDComment(0, "invert")<cr>
  vmap <leader>/ :call NERDComment(0, "invert")<cr>
endif

" Tagbar {{{2
if neobundle#is_sourced('tagbar')
  " ,t to show tags window
  "let Tlist_Show_Menu=1
  nmap <leader>t :TagbarToggle<CR>
  "map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
  "map <C-Left> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
endif

" Gundo {{{2
if neobundle#is_sourced('gundo.vim')
  nmap <leader>g :GundoToggle<CR>
endif

" VimShell {{{2
if neobundle#is_sourced('vimshell.vim')
  " ,sh to open vimshell tab
  nmap <Leader>sh :VimShellTab<CR>
endif

" YankRing {{{2
if neobundle#is_sourced('YankRing.vim')
  let g:yankring_replace_n_pkey = '<leader>['
  let g:yankring_replace_n_nkey = '<leader>]'
  " map ,y to show the yankring
  nmap <leader>y :YRShow<cr>
endif

" indentLine {{{2
if neobundle#is_sourced('indentLine')
  highlight IndentGuidesEven ctermbg=236
  highlight IndentGuidesOdd ctermbg=235

  let g:indentLine_char='┆'
  let g:indentLine_color_term=236
endif

" vimfiler {{{2
if neobundle#is_sourced('vimfiler.vim')
  let g:vimfiler_as_default_explorer=1
endif

" Localvimrc {{{2
if neobundle#is_sourced('localvimrc')
  let g:localvimrc_ask=0
  let g:localvimrc_sandbox=0
endif

" Signify {{{2
if neobundle#is_sourced('vim-signify')
  let g:signify_mapping_next_hunk = '<leader>gj'
  let g:signify_mapping_prev_hunk = '<leader>gk'
end

" Manpageview {{{2
if neobundle#is_sourced('manpageview')
  let g:manpageview_multimanpage=0
endif

" Powerline {{{2
if neobundle#is_sourced('vim-poserline')
  let g:Powerline_symbols='fancy'
endif

" Syntastic {{{2
if neobundle#is_sourced('syntastic')
  let g:syntastic_enable_signs=1
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_auto_loc_list=0
  let g:syntastic_always_populate_loc_list=0
  let g:syntastic_loc_list_height=10
endif

" Solarized {{{2
if neobundle#is_sourced('vim-colors-solarized')
  colorscheme solarized
  let g:solarized_termcolors=256
  "let g:solarized_termcolors=16
  let g:solarized_visibility="high"
  let g:solarized_contrast="high"
  let g:solarized_termtrans=1

  hi Visual term=reverse cterm=reverse guibg=Grey

  set background=dark
endif

" Completion {{{2
" Omni completion settings {{{3
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1
" completing Rails hangs a lot
"let g:rubycomplete_rails = 1

" Neocomplete {{{3
if neobundle#is_sourced('neocomplete.vim')
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1

  " Define dictionary {{{4
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

  " Define keyword {{{4
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Enable heavy omni completion. {{{4
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endif

" Neocomplcache {{{3
if neobundle#is_sourced('neocomplcache.vim')
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

  " Enable heavy features. {{{4
  " Use camel case completion.
  "let g:neocomplcache_enable_camel_case_completion = 1
  " Use underbar completion.
  "let g:neocomplcache_enable_underbar_completion = 1

  " Define dictionary. {{{4
  let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

  " Define keyword. {{{4
  if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings. {{{4
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings. {{{5
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction

  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h>  neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()

  " Close popup by <Space>.
  inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

  " For cursor moving in insert mode(Not recommended) {{{5
  "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplcache_enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplcache_enable_insert_char_pre = 1

  " AutoComplPop like behavior.
  "let g:neocomplcache_enable_auto_select = 1

  " Shell like behavior(not recommended). {{{5
  "set completeopt+=longest
  "let g:neocomplcache_enable_auto_select = 1
  "let g:neocomplcache_disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable heavy omni completion. {{{4
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns   = {}
  endif
  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)'
  let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endif

" Neocomplete & Neocomplcache common configuration {{{2
if neobundle#is_sourced('neocomplcache.vim') || neobundle#is_sourced('neocomplete')
  " Enable omni completion. {{{4
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif
" }}}

" vim-tmux-navigator {{{2
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" AMEN {{{1
NeoBundleCheck
