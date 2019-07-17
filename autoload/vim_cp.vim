function! vim_cp#Skeleton()
    let skeleton_file = expand(g:skeleton_path."skeleton.".expand("%:e"))
    if filereadable(expand(skeleton_file))
        execute "0read " . fnameescape(skeleton_file)
        silent! %s/{untitled}/\=expand("%:t")/gI
        silent! %s/{developer}/\=expand(g:developer)/gI
        silent! %s/{mail}/\=expand(g:mail)/gI
        silent! %s/{company}/\=expand(g:company)/gI
        silent! %s/{webpage}/\=expand(g:webpage)/gI
        silent! %s/{phone}/\=expand(g:phone)/gI
        silent! %s/{version}/\=expand(g:version)/gI
        silent! %s/{description}/\=expand(g:description)/gI
        silent! %s/{verdict}/\=expand(g:verdict)/gI
        silent! %s/{datetime}/\=strftime(g:datetime)/gI
        silent! %s/{date}/\=strftime(g:date)/gI
        cal cursor(g:lineTOgo, 0)
    else
        echo "No skeleton found in for this filetype"
    endif
endfunction


function vim_cp#Datemodf()
    execute "normal ma"
    let replacement="/".g:datemodified_string." ".expand(strftime(g:datemodified))
    let pattern=g:datemodified_string.".*"
    execute '%substitute/' . pattern . replacement
    execute "normal `a"
    echo "Date modified changed"
endfunction



function vim_cp#Link(arg)
    if a:arg == "input"
        let link = input('Link: ')
    else
        let link = a:arg
    endif
    execute "normal ma"
    let replacement="#".g:link_string." ".link
    let pattern=g:link_string.".*"
    execute '%substitute#' . pattern . replacement
    execute "normal `a"
    echo "Link added"
endfunction


function vim_cp#Verdict(arg)
    if a:arg == "input"
        let verdict = input('Verdict: ')
    else
        let verdict = a:arg
    endif
    execute "normal ma"
    let replacement="/".g:verdict_string." ".verdict
    let pattern=g:verdict_string.".*"
    execute '%substitute/' . pattern . replacement
    execute "normal `a"
    echo "verdict added"
endfunction


function vim_cp#MoveToAccepted()
        Verdict Accepetd
        let path = expand("%:p")
        let new_path = substitute(path, g:working_dir, g:final_dir, "")
        exe 'sav' fnameescape(new_path)
        call delete(path)
        if !isdirectory(new_path)
             execute ':silent !mkdir -p %:h'
        endif
        write
        echo "Move to Accepetd directory"
endfunction


function vim_cp#Build()
    write
    make
endfunction


function vim_cp#Compile()
    write
    echo
    if expand("%:e") == "c"
        !gcc -c -g -Wall -Wextra -Wshadow -Wfloat-equal -pedantic -std=c++11 -O2 -Wformat=2 -Wconversion -lm "%"
    elseif expand("%:e") == "cpp"
        !g++ -c -g -Wall -Wextra -Wshadow -Wfloat-equal -pedantic -std=c++11 -O2 -Wformat=2 -Wconversion -lm "%"
    elseif expand("%:e") == "java"
        !javac -d /media/Softwares/Programming "%"
    elseif expand("%:e") == "py"
        echo "Nothing to do"
    elseif expand("%:e") == "sh"
        echo "Nothing to do"
    else
        echo "File Format Not Recognized"
    endif
    
endfunction


function! vim_cp#Run(...)

    if expand("%:e") == "cpp" || expand("%:e") == "c" || expand("%:e") == "java"
		echo "it's working"
        if a:1 == "window"
            if a:2 == "stdio"
                !gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh stdio "%""
            elseif a:2 == "stdo"
                !gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh i "%""
            endif
        elseif a:1 == "normal"
            if a:2 == "stdio"
                !~/.vim/./vim_run_script.sh stdio "%"
            elseif a:2 == "stdo"
                !~/.vim/./vim_run_script.sh i "%"
            elseif a:2 == "stdf"
                !~/.vim/./vim_run_script.sh io "%"
            endif
        endif
    elseif expand("%:e") == "py" || pand("%:e") == "sh"
        w
		echo "%"
        if a:1 == "normal"
            if a:2 == "stdio"
                !~/.vim/./vim_run_script.sh stdio "%"
            elseif a:2 == "stdo"
                !~/.vim/./vim_run_script.sh i "%"
            elseif a:2 == "stdf"
				echo "adsfasdf"
                !~/.vim/./vim_run_script.sh io "%"
            endif
        elseif a:1 == "window"
            if a:2 == "stdio"
				!gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh stdio "%""
            elseif a:2 == "stdo"
				!gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh i "%""
            endif
        endif
    else
        echo "File Format Not Recognized"
    endif
endfunction

