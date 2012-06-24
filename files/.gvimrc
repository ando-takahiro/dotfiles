colorscheme my-wombat
set fuoptions=maxvert,maxhorz
autocmd GUIEnter + set fullscreen

"ツールバーなど非表示
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=R
set guioptions-=L

set guifont=Monaco:h10
set guifontwide=Monaco:h10

set noimdisable
hi Cursor guifg=bg guibg=Gray gui=NONE
hi CursorIM guifg=NONE guibg=Purple gui=NONE
set iminsert=0 imsearch=0
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

