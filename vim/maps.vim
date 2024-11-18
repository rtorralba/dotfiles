map <C-F10> :Breakpoint<cr>

map <C-P> :GFiles<cr>
map <C-H> :History<cr>
map <C-C> :Commands<cr>
map <C-B> :Buffers<cr>

" Tag bar
nmap <F8> :TagbarToggle<CR>

nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tT :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
