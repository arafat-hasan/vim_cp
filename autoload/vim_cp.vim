" FILE: vim_cp.vim
" @author: Arafat Hasan Jenin <opendoor.arafat[at]gmail[dot]com>
" DATE CREATED: 06-12-17 16:58:42 (+06)
" LAST MODIFIED: 28-12-21 21:00:16 (+06)


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
    if filereadable(expand("%:p:r") . ".out")
        silent execute 'call system("rm " . expand("%:p:r") . ".out")'
        if !filereadable(expand("%:p:r") . ".out")
            silent echo "Output file removed"
        endif
    endif
    silent write
    make
endfunction


function vim_cp#Compile()
    silent write
    if expand("%:e") == "c"
        !gcc -c -g -Wall -Wextra -Wshadow -Wfloat-equal -pedantic -std=c++11 -O2 -Wformat=2 -Wconversion -Wno-sign-conversion -lm -o "%:r" "%"
    elseif expand("%:e") == "cpp"
        if filereadable(expand("%:p:r") . ".out")
            silent execute 'call system("rm " . expand("%:p:r") . ".out")'
            if !filereadable(expand("%:p:r") . ".out")
                silent echo "Output file removed"
            endif
        endif
        let script="g++ " . "-g -Wall -Wextra -Wshadow -Wfloat-equal -pedantic -std=c++17 -O2 -Wformat=2 -Wconversion -Wno-sign-conversion -lm -o " . expand("%:p:r") . ".out " . expand("%:p")
        execute 'call system(script)'
        if filereadable(expand("%:p:r") . ".out")
            echo "Compilation finished successfully"
        endif
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

    if expand("%:p:e") == "cpp" || expand("%:p:e") == "c" || expand("%:p:e") == "java"
      let basefilename = expand("%:p:r")

      if !filereadable(expand("%:p:r") . ".out")
        echo "No exceutable file found!"
        return 0
      endif


      if filereadable(expand("%:p:r") . ".out.txt")
          silent execute 'call system("rm " . expand("%:p:r") . ".out.txt")'
          if !filereadable(expand("%:p:r") . ".out.txt")
            silent echo "Output file removed"
          endif
      endif

      if !filereadable(expand("%:p:r") . ".in.txt")
          silent execute 'call system("touch " . expand("%:p:r") . ".in.txt")'
          if filereadable(expand("%:p:r") . ".in.txt")
            silent echo "Input file created"
          endif
      endif

      let script=expand("%:p:r") . ".out < " . expand("%:p:r") . ".in.txt > " . expand("%:p:r") . ".out.txt"
      silent execute 'call system(script)'
      if !filereadable(expand("%:p:r") . ".out.txt")
          echo "Run execution failed"
          return 0
      endif

      let l:currentWindow=winnr()

      let l:fname = basefilename . ".in.txt"
      let bufnum=bufnr(expand(l:fname))
      let winnum=bufwinnr(bufnum)
      if winnum != -1
        " Jump to existing split
        silent exe winnum . "wincmd w"
      else
        silent execute "botright vsplit" l:fname
        vertical resize 80
      endif
    
      let l:fname = basefilename . ".out.txt"
      let bufnum=bufnr(expand(l:fname))
      let winnum=bufwinnr(bufnum)
      if winnum != -1
        " Jump to existing split
        silent exe winnum . "wincmd w"
        silent edit
      else
        silent execute "belowright split" l:fname
      endif

      silent execute l:currentWindow . "wincmd w"
      echo "Execution finished successfully"
      
    elseif expand("%:e") == "py" || expand("%:e") == "sh"
      execute 'call system("./" . expand("%") . " < " . expand("%:r") . ".in > " . expand("%:r") . ".out")'
      echo "Success"
    else
        echo "File Format Not Recognized"
    endif
endfunction

