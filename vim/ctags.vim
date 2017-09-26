" Function: Open tag under cursor in new tab
map <C-D> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

function! GenerateProjectTagsCallback(channel)
    unlet g:generateProjectTagsOutput
    echo 'Project tags generated!'
endfunction

function! GenerateProjectTags()
    if v:version < 800
        echoerr 'Requires VIM version 8 or higher'
        return
    endif

    if exists('g:generateProjectTagsOutput')
        echo 'Already running task in background'
    else
        let g:generateProjectTagsOutput = tempname()
        if !filereadable(".git/php.vendor.tags")
            call GenerateVendorTags()
        endif
        let command = printf('ctags-exuberant --options=%s/dotfiles/vim/ctags.cnf --exclude=vendor -f .git/php.project.tags', $HOME)
        call job_start(command, {'close_cb': 'GenerateProjectTagsCallback', 'out_io': 'file', 'out_name': g:generateProjectTagsOutput})
    endif
endfunction

function! GenerateVendorTagsCallback(channel)
    unlet g:generateVendorTagsOutput
    echo 'Vendor tags generated!'
endfunction

function! GenerateVendorTags()
    if v:version < 800
        echoerr 'Requires VIM version 8 or higher'
        return
    endif

    if exists('g:generateVendorTagsOutput')
        echo 'Already running task in background'
    else
        let g:generateVendorTagsOutput = tempname()
        let command = printf('ctags-exuberant --options=%s/dotfiles/vim/ctags.cnf -f .git/php.vendor.tags vendor', $HOME)
        call job_start(command, {'close_cb': 'GenerateVendorTagsCallback', 'out_io': 'file', 'out_name': g:generateVendorTagsOutput})
    endif
endfunction

autocmd BufWritePost *.php call GenerateProjectTags()

set tags=.git/php.project.tags;
set tags+=.git/php.vendor.tags;
