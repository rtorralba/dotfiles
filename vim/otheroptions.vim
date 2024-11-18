set t_Co=256

" Persistent undo
set undodir=~/.vim/undodir
set undofile

set diffopt=vertical

let g:ctrlp_working_path_mode = 0
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" For update gitgutter faster
set updatetime=250

" For use tabs in makefile
autocmd FileType make setlocal noexpandtab

let g:airline#extensions#ale#enabled = 1

let test#strategy = "vimterminal"

set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'
