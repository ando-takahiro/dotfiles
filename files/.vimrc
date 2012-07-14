let OSTYPE = system('uname')

" NeoBundle
set nocompatible               " required for neobundle
filetype off                   " required for neobundle
filetype plugin indent off     " required for neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle/
  call neobundle#rc(expand('~/.vim-neobundle'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
NeoBundle 'git://github.com/ujihisa/neco-look.git'
NeoBundle 'git://github.com/mileszs/ack.vim.git'
NeoBundle 'git://github.com/embear/vim-localvimrc.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tpope/vim-unimpaired.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/vitaly/vim-gitignore.git'
NeoBundle 'git://github.com/plasticboy/vim-markdown.git'
NeoBundle 'git://github.com/davidoc/taskpaper.vim.git'
NeoBundle 'git://github.com/tmhedberg/matchit.git'
NeoBundle 'git://github.com/vim-scripts/mru.vim.git'

if OSTYPE == "Darwin\n"
  NeoBundle 'git://github.com/aniero/vim-copy-as-rtf.git'
endif

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
set foldmethod=marker
let g:localvimrc_ask = 0

" colorscheme(solarized)
set background=light
colorscheme solarized

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

"javascript setting
autocmd BufNewFile,BufRead Jakefile set filetype=javascript
let g:SimpleJsIndenter_CaseIndentLevel = -1
let g:SimpleJsIndenter_BriefMode = 1
autocmd BufWritePost,FileWritePost *.js JSHint
autocmd BufNewFile,BufRead Jakefile JSHint

" complcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_text_mode_filetypes = {'text': 1, 'javascript': 1, 'markdown': 1, 'perl': 1, 'html': 1}

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" markdown
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

" clipboard
set clipboard=unnamed
