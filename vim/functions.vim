function RemoveTrailing()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>
        normal `z
    endif
endfunction
command RemoveTrailing call RemoveTrailing()

function FixMixedIndent()
    %s/\t/    /g
endfunction
command FixMixedIndent call FixMixedIndent()

function Phpunit()
   execute '!vendor/bin/phpunit --testdox'
endfunction
command Phpunit call Phpunit()

function OpenLaravelView()
    normal yi'
    let view="resources/views/".substitute(getreg('0'), "\\.", "/", "g").".blade.php"
    execute "edit ".view
endfunction
command OpenLaravelView call OpenLaravelView()
nnoremap <silent>gv :OpenLaravelView<CR>
