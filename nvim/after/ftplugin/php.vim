" Be a nice member of the PHP community
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smarttab
setlocal iskeyword-=-
setlocal iskeyword-=_
setlocal comments=s1:/*,mb:*,ex:*/,://,:#
setlocal formatoptions+=cro

" Ignore certain files for CtrlP
set wildignore+=*/public/forum/**
set wildignore+=*/media

" autocomplete
autocmd FileType php set omnifunc=phpactor#Complete
let g:phpcomplete_relax_static_constraint=1
let g:phpcomplete_complete_for_unknown_classes=1
let g:phpcomplete_search_tags_for_variables=1
let g:phpcomplete_parse_docblock_comments=1

" trim white space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd! BufWritePre *.php :call TrimWhiteSpace()

" <3 PHP namespaces
set tags+=.git/tags,.git/tags.vendors

" Sort PHP use statements
" http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>
