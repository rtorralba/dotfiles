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
