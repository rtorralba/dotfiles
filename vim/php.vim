autocmd FileType php setlocal omnifunc=phpactor#Complete
let php_sql_query=1
let php_htmlInStrings=1
" Fix phpcs
command PHPCSFix !php-cs-fixer fix %

" Charge codeigniter snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope codeigniter
" Charge simple mvc framework snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope simplemvcf
autocmd BufNewFile,BufRead *.blade.php set filetype=blade.html

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>i :call phpactor#GotoImplementations()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

let g:vdebug_options = {"path_maps": {"/var/www/html/api": getcwd()}, "port": 9003}

autocmd FileType php set iskeyword+=$
