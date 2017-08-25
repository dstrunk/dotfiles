" Keep good with the Ruby community! Use these settings:
" Softtabs, 2 spaces
setlocal tabstop=2
setlocal shiftwidth=2
setlocal shiftround
setlocal expandtab

" Snippets
:UltiSnipsAddFiletypes ruby
:UltiSnipsAddFiletypes rails

" trim white space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd BufWritePre *.rb :call TrimWhiteSpace()
