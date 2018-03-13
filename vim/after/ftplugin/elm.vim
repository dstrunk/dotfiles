setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smarttab
setlocal iskeyword+=-
setlocal iskeyword+=_
"
" trim white space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd! BufWritePre *.cs :call TrimWhiteSpace()
