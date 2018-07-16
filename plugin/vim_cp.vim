" Variable definitions

let g:skeleton_path = get(g:, 'skeleton_path', "~/.vim/skeleton/")
let g:untitled="untitled" "Automatically replaced with file name
let g:developer = get(g:, 'developer', "Your Beautiful Name")
let g:mail=get(g:, 'mail', "email@example.com")
let g:company=get(g:, 'company', "Company Name")
let g:webpage=get(g:, 'webpage', "www.example.com")
let g:phone=get(g:, 'phone', "+880123456789")
let g:version=get(g:, 'version', "1.0")
let g:description=get(g:, 'description', "Deleted code is debugged code.") 
let g:verdict=""
let g:verdict_string=get(g:, 'verdict_string', "VERDICT:") " Verdict will shown after this string
let g:link_string=get(g:, 'link_string', "LINK:") " Link will shown after this string


let g:datetime="%d-%m-%y %T (%Z)"  "DateTime Foemat
let g:date="%d-%m-%y"   "Date format
let g:datemodified="%d-%m-%y %T (%Z)"   "Date format
let g:datemodified_string=get(g:, 'datemodified_string', "LAST MODIFIED:") "Datemodified will shown after this string
let g:gpl="This wildcard inserts a short GPL notice."   "Not implemented yet
let g:bsd="This wildcard inserts a BSD licence notice." "Not implemented yet
let g:lineTOgo=104  " Line to go after load template

" working and final directory must be under same directory: brother directory :p
let g:working_dir="NC"  " Working Directory Name
let g:final_dir="AC"  " Final Directory Name





au filetype python setlocal mp=python3\ %
au filetype cpp setlocal mp=g++\ -g\ -Wall\ -Wextra\ -Wshadow\ -Wfloat-equal\ -pedantic\ -std=c++11\ -O2\ -Wformat=2\ -Wconversion\ -lm\ %
au filetype java setlocal mp=javac\ %
au filetype sh setlocal mp=bash\ %




command! -nargs=0 Skeleton call vim_cp#Skeleton()
command! -nargs=0 Build call vim_cp#Build()
command! -nargs=0 Compile call vim_cp#Compile()
command! -nargs=* Run call vim_cp#Run(<f-args>)
command! -nargs=0 Datemodf call vim_cp#Datemodf()
command! -nargs=1 Verdict call vim_cp#Verdict(<f-args>)
command! -nargs=1 Link call vim_cp#Link(<f-args>)
command! -nargs=0 MoveToAccepted call vim_cp#MoveToAccepted()




nmap <silent> <leader>sk    :Skeleton<CR>
nmap <silent> <leader>dm    :Datemodf<CR>
nmap <silent> <leader>vr    :Verdict input<CR>
nmap <silent> <leader>ln    :Link input<CR>
nmap <silent> <leader>mv    :MoveToAccepted<CR>

nnoremap <F9> :Build<CR><CR>
inoremap <F9> <ESC>:Build<CR>
nnoremap <F8> :Compile<CR>
inoremap <F8> <ESC>:Compile<CR>

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

