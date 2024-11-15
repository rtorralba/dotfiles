let g:airline#extensions#ale#enabled = 1
let g:ale_php_phpcs_standard = 'psr12'
let g:ale_php_phpcbf_standard = 'psr12'
let g:ale_php_phpstan_configuration = 'phpstan.neon'
let g:phpstan_analyse_level = 8
let g:ale_linters_explicit = 1
let g:ale_php_phpactor_executable = '/home/raul/.vim/plugged/phpactor/bin/phpactor'
let g:php_phpactor_use_global = 0
let g:ale_linters = {
\   'php': ['php', 'phpcs', 'phpstan', 'phpactor'],
\}
