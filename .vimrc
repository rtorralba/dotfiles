set nocompatible

" Vundle
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
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tmhedberg/matchit'
Bundle 'joonty/vdebug'
Bundle 'nanotech/jellybeans.vim'
Bundle 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/EasyGrep'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'

" Snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "bonsaiben/bootstrap-snippets"

" GIT
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" HTML
Plugin 'mattn/emmet-vim'
Plugin 'qbbr/vim-twig'
Plugin 'xsbeats/vim-blade'

" PHP
Bundle 'StanAngeloff/php.vim'
Bundle 'docteurklein/vim-symfony'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'mikehaertl/pdv-standalone'
Bundle 'EvanDotPro/php_getset.vim'

" Ionic
Plugin 'burnettk/vim-angular'

" CSS
Plugin 'ap/vim-css-color'

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
set incsearch                  " find as you type search
set ignorecase                 " case insensitive search
set smartindent
set backspace=2

filetype plugin on
syntax enable
syntax on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

" NERDTree
map <tab> :NERDTreeToggle<CR>
let g:NERDTreeCopyCmd= 'cp -r '
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1

" gui
set guioptions-=T "Quitar la toolbar para tener más espacio
set guioptions-=m "Quitar la barra de menú para tener más espacio
set guitablabel=\[%N\]\ %t\ %M

" php-doc
nnoremap <C-D> :call PhpDocSingle()<CR>

" Airline -----------------------------------------
set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" Airline: syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"Airline ------------------------------------------

" phpfolding
"let g:DisableAutoPHPFolding = 1
"let php_folding=0
"autocmd FileType php setlocal foldmethod=manual
"autocmd FileType php EnableFastPHPFolds

" Function: Open tag under cursor in new tab
map <C-D> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Generate tags
command GenerateTags !ctags -R --fields=+aimS --tag-relative=yes --exclude=.git -f ./.git/tags

" Charge codeigniter snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope codeigniter
" Charge simple mvc framework snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope simplemvcf

" Remove trailing
function RemoveTrailing()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
    endif
endfunction
command RemoveTrailing call RemoveTrailing()

" Fix mixed indent
function FixMixedIndent()
    %s/\t/    /g
endfunction
command FixMixedIndent call FixMixedIndent()


let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers=['php', 'phpcs']
"let g:syntastic_php_checkers=['php']
let g:syntastic_php_phpcs_args='--standard=PSR2'

" Fix phpcs
command PHPCSFix !php-cs-fixer fix %

" surround with tr function
vmap tr di<?= tr('<ESC>pa') ?><ESC>

" surround with getSEOLink function
vmap eo di<?= getSEOLink('<ESC>pa') ?><ESC>

set t_Co=256

map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" Persistent undo
set undodir=~/.vim/undodir
set undofile

" Online doc
function! OnlineDoc()
    let s:wordUnderCursor = expand("<cword>")

    if &ft =~ "cpp"
        let s:urlTemplate = "http://doc.trolltech.com/4.1/%.html"
    elseif &ft =~ "ruby"
        let s:urlTemplate = "http://www.ruby-doc.org/core/classes/%.html"
    elseif &ft =~ "perl"
        let s:urlTemplate = "http://perldoc.perl.org/functions/%.html"
    elseif &ft =~ "php"
        let s:urlTemplate = "http://php.net/manual/es/function.%.php"
        let s:wordUnderCursor = substitute(s:wordUnderCursor, "_", "-", "g")
        echo s:wordUnderCursor
    else
        return
    endif
    let s:browser = "google-chrome-stable"
    let s:url = substitute(s:urlTemplate, "%", s:wordUnderCursor, "g")
    let s:cmd = "silent !" . s:browser . " " . s:url . "&"
    execute s:cmd
endfunction
" Online doc search.
map <F3> :call OnlineDoc()<CR>

" indentLine faster
let g:indentLine_faster = 1

set colorcolumn=120

"let delimitMate_expand_cr=1

map <C-F10> :Breakpoint<cr>

set diffopt=vertical

let g:EasyGrepRecursive=1
let g:EasyGrepCommand=1 " 0 vimgrep, 1 grep
