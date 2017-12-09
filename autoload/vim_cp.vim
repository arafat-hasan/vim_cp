function! vim_cp#Skeleton()
    if expand("%:e") == "cpp"
        0r ~/.vim/skeleton/skeleton.cpp
        1,5s/{{untitled}}/\=expand("%:t")/gI
        6,11s/{{long_date}}/\=strftime("%d-%m-%y %T (%Z)")/gI
        14,18s/{{short_date}}/\=strftime("%d-%m-%y")/gI
        91
    elseif expand("%:e") == "c"
        0r ~/.vim/skeleton/skeleton.cpp
        1,5s/{{untitled}}/\=expand("%:t")/gI
        6,11s/{{long_date}}/\=strftime("%d-%m-%y %T (%Z)")/gI
        14,18s/{{short_date}}/\=strftime("%d-%m-%y")/gI
        91
    else
        echo "File format not recognized"
    endif
endfunction


function vim_cp#Datemodf()
    execute "normal ma"
     try
        exe "1," . 19 "g/LAST MODIFIED:.*/s/LAST MODIFIED:.*/LAST MODIFIED: " .strftime("%d-%m-%y %T (%Z)")
        catch /^Vim(substitute):E486:/
             echo v:exception
        catch /E16/
             echo v:exception
     endtry
    execute "normal `a"
endfunction


function vim_cp#MoveToAccepted()
        15,19s/{{File Created}}/File\ Created, Accepted/gI
        let path = expand("%:p")
        let new_path = substitute(path, "NC", "AC", "")
        exe 'sav' fnameescape(new_path)
        call delete(path)
        if !isdirectory(new_path)
             execute ':silent !mkdir -p %:h'
        endif
        write
endfunction


function! vim_cp#Build(arg)
    if a:arg == "save"
        w
        echom "saving"
    endif

    if expand("%:e") == "c"
        !~/.vim/./vim_run_script.sh compile-build "%"
    elseif expand("%:e") == "cpp"
        !~/.vim/./vim_run_script.sh compile-build "%"
    elseif expand("%:e") == "java"
        echo "Nothing to do"
    elseif expand("%:e") == "py"
        echo "Nothing to do"
    elseif expand("%:e") == "sh"
        echo "Nothing to do"
    endif   
endfunction


function! vim_cp#Compile(arg)
    if a:arg == "save"
        w
        echom "saving"
    endif
    
    if expand("%:e") == "c"
        !~/.vim/./vim_run_script.sh compile "%"
    elseif expand("%:e") == "cpp"
        !~/.vim/./vim_run_script.sh compile "%"
    elseif expand("%:e") == "java"
        !~/.vim/./vim_run_script.sh compile "%"
    elseif expand("%:e") == "py"
        echo "Nothing to do"
    elseif expand("%:e") == "sh"
        echo "Nothing to do"
    endif
    
endfunction


function! vim_cp#Run(...)

    if expand("%:e") == "cpp"
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
    elseif expand("%:e") == "c"
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
    elseif expand("%:e") == "py"
        w
        if a:1 == "normal"
            if a:2 == "stdio"
                !python3 "%"
            elseif a:2 == "stdo"
                !python3 "%" < input.txt
            elseif a:2 == "stdf:
                echo "Not set yet"
            endif
        elseif a:1 == "window"
            echo "Not set yet"
        endif
        
    elseif expand("%:e") == "sh"
        w
        if a:1 == "normal"
            if a:2 == "stdio"
                !bash "%"
            elseif a:2 == "stdo"
                !bash "%" < input.txt
            elseif a:2 == "stdf:
                echo "Not set yet"
            endif
        elseif a:1 == "window"
            echo "Not set yet"
        endif
    elseif expand("%:e") == "java"
        if a:1 == "normal"
            if a:2 == "stdio"
                !~/.vim/./vim_run_script.sh stdio "%"
            elseif a:2 == "stdo"
                !~/.vim/./vim_run_script.sh i "%"
            elseif a:2 == "stdf"
                !~/.vim/./vim_run_script.sh io "%"
            endif
        elseif a:1 == "window"
            if a:2 == "stdio"
                !gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh stdio "%""
            elseif a:2 == "stdo"
                !gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh i "%"" 
            elseif a:2 == "stdf"
                !gnome-terminal --hide-menubar --geometry 74x43+700+00 --command ~/.vim/./"vim_run_script.sh io "%""
            endif
        endif
    endif
endfunction

