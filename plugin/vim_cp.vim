command! -nargs=0 Skeleton call vim_cp#Skeleton()
command! -nargs=1 Build call vim_cp#Build(<f-args>)
command! -nargs=1 Compile call vim_cp#Compile(<f-args>)
command! -nargs=* Run call vim_cp#Run(<f-args>)
command! -nargs=0 Datemodf call vim_cp#Datemodf()
command! -nargs=0 MoveToAccepted call vim_cp#MoveToAccepted()

nmap <silent> :sk :Skeleton<CR>
nmap <silent> :dm :Datemodf<CR>
nmap <silent> :mv :MoveToAccepted<CR>


nnoremap <F9> :Build save<CR>
inoremap <F9> <ESC>:Build save<CR>
nnoremap <S-F9> :Build dont_save<CR>
inoremap <S-F9> <ESC>:Build dont_save<CR>
nnoremap <F8> :Compile save<CR>
inoremap <F8> <ESC>:Compile save<CR>
nnoremap <S-F8> :Compile dont_save<CR>
inoremap <S-F8> <ESC>:Compile dont_save<CR>



nnoremap <F5> :Run normal stdio<CR>
inoremap <F5> <ESC>:Run normal stdio<CR>
nnoremap <S-F5> :Run window stdio<CR><CR>
inoremap <S-F5> <ESC>:Run window stdio<CR><CR>

nnoremap <F6> :Run normal stdo<CR>
inoremap <F6> <ESC>:Run normal stdo<CR>
nnoremap <S-F6> :Run window stdo<CR><CR>
inoremap <S-F6> <ESC>:Run window stdo<CR><CR>

nnoremap <F7> :Run normal stdf<CR>
inoremap <F7> <ESC>:Run normal stdf<CR>




"************************C/C++ Compile, build, run********************************
"nnoremap  <silent> <F5> :!~/.vim/./vim_run_script.sh stdio<CR>
"inoremap  <silent> <F5> <ESC>:!~/.vim/./vim_run_script.sh stdio<CR>
"nnoremap  <silent> <S-F5> :!gnome-terminal --hide-menubar --geometry 74x43+700+00 -e ~/.vim/./"vim_run_script.sh stdio"<CR><CR>
"inoremap  <silent> <S-F5> <ESC>:!gnome-terminal --hide-menubar --geometry 74x43+700+00 -e ~/.vim/./"vim_run_script.sh stdio"<CR><CR>

"nnoremap  <silent> <F6> :!~/.vim/./vim_run_script.sh i<CR>
"inoremap  <silent> <F6> <ESC>:!~/.vim/./vim_run_script.sh i<CR>
"nnoremap  <silent> <S-F6> :!gnome-terminal --hide-menubar --geometry 74x43+700+00 -e ~/.vim/./"vim_run_script.sh i"<CR><CR>
"inoremap  <silent> <S-F6> <ESC>:!gnome-terminal --hide-menubar --geometry 74x43+700+00 -e ~/.vim/./"vim_run_script.sh i"<CR><CR>
"nnoremap  <silent> <F7> :!~/.vim/./vim_run_script.sh io<CR>
"inoremap  <silent> <F7> <ESC>:!~/.vim/./vim_run_script.sh io<CR>
"nnoremap  <silent> <S-F7> :!gnome-terminal --hide-menubar --geometry 74x43+700+00 -e ~/.vim/./"vim_run_script.sh io"<CR><CR>
"inoremap  <silent> <S-F7> <ESC>:!gnome-terminal --hide-menubar --geometry 74x43+700+00 -e ~/.vim/./"vim_run_script.sh io"<CR><CR>
"nnoremap  <silent> <F8> :w <bar> !~/.vim/./vim_run_script.sh compile "%"<CR>
"inoremap  <silent> <F8> <ESC> :w <bar> !~/.vim/./vim_run_script.sh compile "%"<CR>



"*****************python***********************
"nnoremap  <silent> <F3> :w<CR>:!python3 "%"<CR>
"inoremap  <silent> <F3> <ESC>:w<CR>:!python3 "%"<CR>
"nnoremap  <silent> <S-F3> :w<CR>:!python3 "%" < input.txt<CR>
"inoremap  <silent> <S-F3> <ESC>:w<CR>:!python3 "%" < input.txt<CR>

"*****************bash***********************
"nnoremap  <silent> <F4> :w<CR>:!bash "%"<CR>
"inoremap  <silent> <F4> <ESC>:w<CR>:!bash "%"<CR>


