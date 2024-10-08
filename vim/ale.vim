call ale#linter#Define('php', {
\   'name': 'intelephense',
\   'lsp': 'stdio',
\   'executable': 'intelephense',
\   'command': '%e --stdio',
\   'project_root': function('ale_linters#php#langserver#GetProjectRoot')
\ })
let g:airline#extensions#ale#enabled = 1
let g:ale_php_phpcs_standard = 'psr12'
let g:ale_php_phpcbf_standard = 'psr12'
let g:ale_php_phpstan_configuration = 'phpstan.neon'
let g:phpstan_analyse_level = 8
let b:ale_linters = {'php': ['phpcs', 'phpstan', 'intelephense']}
let g:ale_php_php_executable = 'docker compose -f .docker/docker-compose.yml -T exec app php'
let g:ale_php_phpcs_executable = 'docker compose -f .docker/docker-compose.yml -T exec app vendor/bin/phpcs'
