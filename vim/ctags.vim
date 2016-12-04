" Function: Open tag under cursor in new tab
map <C-D> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Generate tags
command GenerateTags !ctags -R --fields=+aimS --tag-relative=yes --exclude=.git -f ./.git/tags
let g:easytags_file = '.git/tags'
set tags=.git/tags;
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 1
let g:easytags_async = 1
