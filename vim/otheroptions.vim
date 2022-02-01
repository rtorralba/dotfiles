set t_Co=256

" Persistent undo
set undodir=~/.vim/undodir
set undofile

set diffopt=vertical

let g:ctrlp_working_path_mode = 0
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:tsuquyomi_completion_detail = 1

let g:EasyGrepFilesToExclude=".git,node_modules,vendor,plugins,package.json,package-lock.json,vendor.js"

" For update gitgutter faster
set updatetime=250

let g:closetag_filetypes = 'html,xhtml,phtml,blade.html'

" For use tabs in makefile
autocmd FileType make setlocal noexpandtab

let g:snipMate = { 'snippet_version' : 1 }

let g:shoot_save_path = $HOME . "/Imágenes/"
