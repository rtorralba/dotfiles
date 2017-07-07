" Function: Open tag under cursor in new tab
map <C-D> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" This callback will be executed when the entire command is completed
function! GenerateTagsClose(channel)
  " Read the output from the command into the quickfix window
  "execute "cfile! " . g:generateTagsOutput
  " Open the quickfix window
  "copen
  unlet g:generateTagsOutput
endfunction

function! GenerateTags()
  " Make sure we're running VIM version 8 or higher.
  if v:version < 800
    echoerr 'RunBackgroundCommand requires VIM version 8 or higher'
    return
  endif

  if exists('g:generateTagsOutput')
    echo 'Already running task in background'
  else
    let g:generateTagsOutput = tempname()
    let command = printf('ctags --options=%s/dotfiles/vim/ctags.cnf', $HOME)
    call job_start(command, {'close_cb': 'GenerateTagsClose', 'out_io': 'file', 'out_name': g:generateTagsOutput})
  endif
endfunction

autocmd BufWritePost *.php call GenerateTags()

set tags=.git/tags;
