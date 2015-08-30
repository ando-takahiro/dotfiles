let OSTYPE = system('uname')

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/ando/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/ando/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" My own modules
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/ujihisa/neco-look.git'
NeoBundle 'git://github.com/rking/ag.vim.git'
NeoBundle 'git://github.com/embear/vim-localvimrc.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tpope/vim-unimpaired.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/tyru/open-browser.vim.git'
NeoBundle 'git://github.com/vitaly/vim-gitignore.git'
NeoBundle 'git://github.com/tmhedberg/matchit.git'
NeoBundle 'git://github.com/vim-scripts/mru.vim.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/bling/vim-airline.git'
NeoBundle 'git://github.com/terryma/vim-multiple-cursors.git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'git://github.com/scrooloose/syntastic.git'

if OSTYPE == "Darwin\n"
  NeoBundle 'git://github.com/zerowidth/vim-copy-as-rtf.git'
endif
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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
let g:SimpleJsIndenter_CaseIndentLevel = -1
let g:SimpleJsIndenter_BriefMode = 1

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
if OSTYPE == "Linux\n"
set clipboard=unnamedplus
else
set clipboard=unnamed
endif

" colorscheme(solarized)
set background=light
colorscheme solarized

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
