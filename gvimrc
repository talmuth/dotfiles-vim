set guifont=PragmataPro:h16
set cul

set background=dark
"colorscheme railscasts
colorscheme solarized

highlight Pmenu       guibg=#000000
highlight PmenuSel    guibg=#525252
highlight PmenuSbar   guibg=#000000
highlight PmenuThumb  guibg=#525252

highlight StatusLine    guifg=#BC9458
highlight StatusLineNC  guifg=#799C65

highlight NonText       guifg=#363636
highlight SpecialKey    guifg=#B3002C

"highlight User1       guifg=#33AA00

"highlight User2       guifg=#AAAA77

"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
"set guioptions-=r  "remove right-hand scroll bar

"nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
"nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
"nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"au GUIEnter * :call Maximize_Window()

let g:NERDTreeDirArrows=1

let g:solarized_visibility="low"
