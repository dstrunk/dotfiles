" Snippets
:UltiSnipsAddFiletypes ruby
:UltiSnipsAddFiletypes rails

" trim white space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd BufWritePre *.rb :call TrimWhiteSpace()
