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
    let oldreg=getreg('0')
    normal yi'
    let view="resources/views/".substitute(getreg('0'), "\\.", "/", "g").".blade.php"
    let @0=oldreg
    execute "edit ".view
endfunction
command OpenLaravelView call OpenLaravelView()
nnoremap <silent>gv :OpenLaravelView<CR>

function OpenLaravelController()
    let oldreg=getreg('0')
    normal yi'
    let routeArray=split(getreg('0'), '@')
    let controller="app/Http/Controllers/".routeArray[0].".php"
    let @0=oldreg
    execute "edit ".controller
    let line=search('function '.routeArray[1].'(')
    normal :line
endfunction
command OpenLaravelController call OpenLaravelController()
nnoremap <silent>gc :OpenLaravelController<CR>
