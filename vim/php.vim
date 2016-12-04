autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1
" Fix phpcs
command PHPCSFix !php-cs-fixer fix %

" Charge codeigniter snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope codeigniter
" Charge simple mvc framework snippets
autocmd BufNewFile,BufRead *.php SnipMateLoadScope simplemvcf
