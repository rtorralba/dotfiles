" Remove trailing
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

" Fix mixed indent
function FixMixedIndent()
    %s/\t/    /g
endfunction
command FixMixedIndent call FixMixedIndent()
