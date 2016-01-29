" Be a nice member of the PHP community
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal autoindent
setlocal copyindent
setlocal smarttab

" Ignore certain files for CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/media

" Let's run PHPUnit tests
function! RunPHPUnitTest()
  cd %:p:h
  let result = system("phpunit " . bufname("%"))
  split __PHPUnit_Result__
  normal! ggdG
  setlocal buftype=nofile
  call VtrSendCommandToRunner! append(0, split(result, '\v\n'))
  cd -
endfunction

map <leader>t :call RunPHPUnitTest()<cr>

" Snippets
:UltiSnipsAddFiletypes php
:UltiSnipsAddFiletypes php-laravel
:UltiSnipsAddFiletypes php-phpunit
:UltiSnipsAddFiletypes php-symfony2

" autocomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_relax_static_constraint=1
let g:phpcomplete_complete_for_unknown_classes=1
let g:phpcomplete_search_tags_for_variables=1
let g:phpcomplete_parse_docblock_comments=1

" trim white space
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd BufWritePre *.php :call TrimWhiteSpace()