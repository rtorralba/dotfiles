" Function: Open tag under cursor in new tab
map <C-D> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

function! GenerateTagsCallback(channel)
  unlet g:generateTagsOutput
  echo 'Tags generated!'
endfunction

function! GenerateTags()
  if v:version < 800
    echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
    return
  endif

  if exists('g:generateTagsOutput')
    echo 'Already running task in background'
  else
    execute "silent !rm -f .git/tags"
    let g:generateTagsOutput = tempname()
    let command = printf('ctags --options=%s/dotfiles/vim/ctags.cnf', $HOME)
    call job_start(command, {'close_cb': 'GenerateTagsCallback', 'out_io': 'file', 'out_name': g:generateTagsOutput})
  endif
endfunction

autocmd BufWritePost *.php call GenerateTags()

set tags=.git/tags;
