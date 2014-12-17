set nocompatible

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Mis plugins
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/syntastic'
Bundle 'tmhedberg/matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'joonty/vdebug'
Bundle 'nanotech/jellybeans.vim'
Bundle 'php-doc-upgrade'
Bundle 'bling/vim-airline'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'donnut/vim-php54-syntax'
Bundle 'Yggdroot/indentLine'

" Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" GIT
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" Twig
Bundle 'evidens/vim-twig'

" Shell in vim
Bundle 'pthrasher/conqueterm-vim'

" Symfony

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme jellybeans
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ai
set encoding=utf-8
set nowrap
set hlsearch
set smartindent

"Quitar la toolbar para tener más espacio
set guioptions-=T

"Quitar la barra de menú para tener más espacio
set guioptions-=m

filetype plugin on
syntax enable
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

" NERDTree
"map <silent> <Tab> :NERDTreeToggle<CR>
map <silent> <Tab> :NERDTreeTabsToggle<CR>
let NERDTreeShowBookmarks=1
let g:NERDTreeCopyCmd= 'cp -r '
let NERDTreeChDirMode=2
let g:nerdtree_tabs_open_on_gui_startup=0

" Tabs
"set guitablabel=%t
set guitablabel=\[%N\]\ %t\ %M

"Brackets
"inoremap { {<CR>}<Esc>ko<Tab>
"
""Autoclose
"inoremap [ []<Esc>i
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i

"XML tags
""autocmd FileType html,xml inoremap > ><CR></<C-X><C-O><Esc>ko<Tab>

"php-doc
nnoremap <C-P> :call PhpDocSingle()<CR>

"Airline
set laststatus=2

"Folding
let php_folding = 1
set foldmethod=syntax

" Function: Open tag under cursor in new tab
map <C-D> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open shell
map <F9> :ConqueTermSplit bash<CR>

" Generate tags
command GenerateTags !ctags -R --fields=+aimS --languages=php

" phpcomplete-extended
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:phpcomplete_index_composer_command="php /usr/local/bin/composer"

" Charge codeigniter snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope codeigniter

" Remove trailing
nnoremap <F11> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
