" NeoBundle
set nocompatible               " required for neobundle
filetype off                   " required for neobundle
filetype plugin indent off     " required for neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle/
  call neobundle#rc(expand('~/.vim-neobundle'))
endif

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/mileszs/ack.vim.git'
NeoBundle 'git://github.com/embear/vim-localvimrc.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tpope/vim-unimpaired.git'
NeoBundle 'git://github.com/aniero/vim-copy-as-rtf.git'

filetype plugin on
filetype indent on

" basic settings
syntax on

set ts=4 sw=4
set softtabstop=4
set incsearch
if has("gui_running")
  set migemo
endif
set autoindent
set smarttab
set expandtab
set lazyredraw
set wildmenu
set wildmode=list:full
set noswapfile
set autoread
let g:localvimrc_ask = 0

" マウス
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" ステータスライン関連
set laststatus=2
set statusline=%F%m%r%h%w\%=%{fugitive#statusline()}[%Y]\[%{&ff}]\[%{&fileencoding}]\[%v,%l/%L]
set wildmenu
set wildmode=list:longest

" エンコーディング関連
set ffs=unix,dos,mac " 改行文字

" 文字コードの自動認識
" 適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set fileformats=unix,dos,mac

"カーソルキーで行末／行頭の移動可能に設定。
set whichwrap=b,s,[,],<,>

"actionscript setting
autocmd BufNewFile,BufRead *.as set filetype=actionscript ts=4 sw=4 noexpandtab softtabstop=4
filetype plugin indent on

"javascript setting
autocmd BufNewFile,BufRead Jakefile set filetype=javascript
let g:SimpleJsIndenter_CaseIndentLevel = -1
let g:SimpleJsIndenter_BriefMode = 1
autocmd BufWritePost,FileWritePost *.js JSHint
autocmd BufNewFile,BufRead Jakefile JSHint

" complcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" markdown
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

" clipboard
set clipboard=unnamed
